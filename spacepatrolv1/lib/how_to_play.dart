import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';
import 'package:spacepatrolv1/view.dart';

class HowToPlay{

  final SpacePatrolGame game;
  Rect rect;
  Sprite sprite;

  HowToPlay(this.game) {
    rect = Rect.fromLTWH(
       game.tileSize-10,
      game.screenSize.height - (game.tileSize * 12),
     512/1.5,
      512/1.5,
    );
    sprite = Sprite('ui/how-to-play-gui.png');
  }

  void render(Canvas c) {sprite.renderRect(c, rect);}

  void update(double t) {}

  void onTapDown(){
    game.activeView = View.playing;
  }
}