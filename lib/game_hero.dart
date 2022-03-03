import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_island/player_sprite_sheet.dart';
import 'package:game_island/strings.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting {
  GameHero({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleLeft: PlayerSpriteSheet().heroIdleLeft,
            idleRight: PlayerSpriteSheet().heroIdleRight,
            runLeft: PlayerSpriteSheet().heroRunLeft,
            runRight: PlayerSpriteSheet().heroRunRight,
          ),
          speed: 50,
        ) {
    setupCollision(CollisionConfig(
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(8, 5),
          align: Vector2(4, 11),
        ),
      ],
    ));

    setupLighting(LightingConfig(
      radius: tileSize * 1.5,
      color: Colors.transparent,
      blurBorder: tileSize * 1.5,
    ));
  }

  bool canMove = true;

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN &&
        (event.id == 1 || event.id == LogicalKeyboardKey.space.keyId)) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (canMove) {
      super.joystickChangeDirectional(event);
    }
  }

  @override
  void die() {
    if (lastDirection == Direction.left) {
      animation?.playOnce(
        PlayerSpriteSheet().dieLeft,
        runToTheEnd: true,
        onFinish: removeFromParent,
      );
      return;
    }
    animation?.playOnce(
      PlayerSpriteSheet().dieRight,
      runToTheEnd: true,
      onFinish: removeFromParent,
    );
    super.die();
  }

  @override
  void receiveDamage(double damage, from) {
    canMove = false;
    if (lastDirection == Direction.left) {
      animation?.playOnce(
        PlayerSpriteSheet().receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
      return;
    }
    animation?.playOnce(
      PlayerSpriteSheet().receiveDamageRight,
      runToTheEnd: true,
      onFinish: () => canMove = true,
    );
    super.receiveDamage(damage, from);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(tileSize * 0.8, tileSize * 0.8),
      sizePush: tileSize * 0.5,
      animationLeft: PlayerSpriteSheet().attackLeft,
      animationDown: PlayerSpriteSheet().attackDown,
      animationRight: PlayerSpriteSheet().attackRight,
      animationUp: PlayerSpriteSheet().attackUp,
    );
  }
}
