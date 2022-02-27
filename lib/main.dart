import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/decorations/lamp_decoration.dart';
import 'package:game_island/game_enemy.dart';
import 'package:game_island/game_hero.dart';
import 'package:game_island/interface/player_interface.dart';
import 'package:game_island/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BonfireTiledWidget(
        joystick: Joystick(
          keyboardConfig: KeyboardConfig(),
          directional: JoystickDirectional(color: Colors.orange),
          actions: [
            JoystickAction(
              actionId: 1,
              color: Colors.orange,
              margin: const EdgeInsets.all(40),
            )
          ],
        ),
        map: TiledWorldMap(
          'map/island.json',
          objectsBuilder: {
            'Enemy': (properties) => GameEnemy(position: properties.position),
            'Lamp': (properties) =>
                LampDecoration(position: properties.position),
          },
        ),
        player: GameHero(
          position: Vector2(17 * tileSize, 12 * tileSize),
        ),
        overlayBuilderMap: {
          PlayerInterface.overlayKey: (context, game) =>
              PlayerInterface(game: game),
        },
        initialActiveOverlays: const [PlayerInterface.overlayKey],
        cameraConfig: CameraConfig(
          moveOnlyMapArea: true,
          zoom: 2.5,
          sizeMovementWindow: Vector2(tileSize * 3, tileSize * 3),
        ),
        lightingColorGame: Colors.black.withOpacity(0.7),
      ),
    );
  }
}
