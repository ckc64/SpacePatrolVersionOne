
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class Planets{
  Rect planetRect;
  Paint planetPaint;
  final SpacePatrolGame game;
  bool isDead=false;
  List<Sprite>planetSprite;
  double planetRocketSpriteIndex = 0;

  Planets(this.game);

  void render(Canvas canvas){
        planetSprite[planetRocketSpriteIndex.toInt()].renderRect(canvas, planetRect.inflate(7));
  }

  void update(double timeDelta){
    checkIfOffScreen();
      planetRect = planetRect.translate(0, game.tileSize * 1.5 * timeDelta );
  }

  void checkIfOffScreen(){
    if(planetRect.top > game.screenSize.height){
      isDead = true;
    }
    
  }

}