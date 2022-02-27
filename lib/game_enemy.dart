import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/enemy_sprite_sheet.dart';
import 'package:game_island/player_sprite_sheet.dart';
import 'package:game_island/strings.dart';

class GameEnemy extends SimpleEnemy with ObjectCollision {
  GameEnemy({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleLeft: EnemySpriteSheet().enemyIdleLeft,
            idleRight: EnemySpriteSheet().enemyIdleRight,
            runLeft: EnemySpriteSheet().enemyRunLeft,
            runRight: EnemySpriteSheet().enemyRunRight,
          ),
          speed: 20,
        ) {
    setupCollision(CollisionConfig(
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(8, 5),
          align: Vector2(4, 11),
        ),
      ],
    ));
  }

  bool canMove = true;

  @override
  void update(double dt) {
    if (canMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          _executeAttack();
        },
        margin: 4,
      );
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 2,
      height: 2,
      align: const Offset(0, -5),
    );
    super.render(canvas);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(double damage, from) {
    canMove = false;
    if (lastDirection == Direction.left) {
      animation?.playOnce(
        EnemySpriteSheet().receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
      return;
    }
    animation?.playOnce(
      EnemySpriteSheet().receiveDamageRight,
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
