
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/character/spacerocket.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class Rocket extends SpaceRocket{
   double get speed => game.tileSize * 3;
  Rocket(SpacePatrolGame game,double x,double y) : super(game){
      spaceRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
      spaceRocketSprite = List();
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-1.png'));
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-2.png'));
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-3.png'));
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-4.png'));
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-5.png'));
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-6.png'));
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-7.png'));
      spaceRocketSprite.add(Sprite('spacerocket/space-rocket-8.png'));
  }

}