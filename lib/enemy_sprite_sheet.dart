import 'package:bonfire/bonfire.dart';

class EnemySpriteSheet {
  Future<SpriteAnimation> get enemyIdleLeft => SpriteAnimation.load(
        'orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );

  Future<SpriteAnimation> get enemyIdleRight => SpriteAnimation.load(
        'orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get enemyRunRight => SpriteAnimation.load(
        'orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );

  Future<SpriteAnimation> get enemyRunLeft => SpriteAnimation.load(
        'orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
        ),
      );

  Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load(
        'orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 96),
        ),
      );

  Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load(
        'orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 96),
        ),
      );
}
