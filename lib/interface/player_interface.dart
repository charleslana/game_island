import 'dart:async';

import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';

class PlayerInterface extends StatefulWidget {
  const PlayerInterface({
    required this.game,
    Key? key,
  }) : super(key: key);

  final BonfireGame game;

  static const overlayKey = 'playerInterface';

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late Timer _lifeTimer;
  double life = 0;
  double widthMax = 100;
  double witdhCurrent = 100;

  @override
  void initState() {
    _lifeTimer = Timer.periodic(const Duration(milliseconds: 100), _verifyLife);
    super.initState();
  }

  @override
  void dispose() {
    _lifeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              Container(
                width: witdhCurrent,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                width: widthMax,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _verifyLife(Timer timer) {
    if (life != (widget.game.player?.life ?? 0)) {
      setState(() {
        life = widget.game.player?.life ?? 0;
        final double percent = life / (widget.game.player?.maxLife ?? 0);
        witdhCurrent = widthMax * percent;
      });
    }
  }
}
