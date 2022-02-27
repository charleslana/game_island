import 'package:bonfire/bonfire.dart';
import 'package:game_island/player_sprite_sheet.dart';
import 'package:game_island/strings.dart';

class GameHero extends SimplePlayer with ObjectCollision {
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
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
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
