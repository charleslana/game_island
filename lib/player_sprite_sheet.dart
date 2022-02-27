import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );

  Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );

  Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
        ),
      );

  Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
        'atack_effect_left.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        'atack_effect_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> get attackUp => SpriteAnimation.load(
        'atack_effect_bottom.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> get attackDown => SpriteAnimation.load(
        'atack_effect_top.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
}
