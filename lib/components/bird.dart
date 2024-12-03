import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  Bird() : super(position: Vector2(birdStartX, birdStartY),
      size: Vector2(birdWidth, birdHeight));

  double velocity = 0;


  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    sprite = await Sprite.load('bird.png');

    add(RectangleHitbox());
  }

  void flap() {
    velocity = jumpStrength;
  }

  @override
  void update(double dt) {
    velocity += gravity * dt;

    position.y += velocity * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);

    if(other is Ground){
      (parent as FlappyBird).gameOver();
    }
    if(other is Pipe){
      (parent as FlappyBird).gameOver();
    }
  }
}