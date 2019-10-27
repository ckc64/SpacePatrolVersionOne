import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';
import 'package:spacepatrolv1/view.dart';

class StartButton{

  final SpacePatrolGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize+55,
      (game.screenSize.height * .75) - (game.tileSize * 1.5),
     512/2.5,
      256/2.5,
    );
    sprite = Sprite('ui/play-gui.png');
  }

  void render(Canvas c) {sprite.renderRect(c, rect);}

  void update(double t) {}

  void onTapDown(){
    game.activeView = View.playing;
  }
}