import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class HomeView{

  final SpacePatrolGame game;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.game) {
    titleRect = Rect.fromLTWH(
      -game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 4),
     512,
      180,
    );
    titleSprite = Sprite('ui/space-title.png');
  }

  void render(Canvas c) {titleSprite.renderRect(c, titleRect);}

  void update(double t) {}
}