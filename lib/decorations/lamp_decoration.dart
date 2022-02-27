import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/strings.dart';

class LampDecoration extends GameDecoration with ObjectCollision, Lighting {
  LampDecoration({required Vector2 position})
      : super(
          position: position,
          size: Vector2(tileSize, tileSize),
        ) {
    setupCollision(CollisionConfig(
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(10, 10),
          align: Vector2(3, 4),
        ),
      ],
    ));

    setupLighting(LightingConfig(
      radius: tileSize * 1.5,
      color: Colors.orange.withOpacity(0.3),
      withPulse: true,
    ));
  }
}
