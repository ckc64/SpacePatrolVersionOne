
import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class MeteorRocket{

  Rect meteorRect;
  Paint meteorPaint;
  final SpacePatrolGame game;
  bool isDead=false;
  List<Sprite>meteorSprite;
double meteorRocketSpriteIndex = 0;


  MeteorRocket(this.game);
    
  

  void render(Canvas canvas){
        meteorSprite[meteorRocketSpriteIndex.toInt()].renderRect(canvas, meteorRect.inflate(3));
  }

  void update(double timeDelta){
    checkIfOffScreen();
      meteorRect = meteorRect.translate(0, game.tileSize * 1.5 * timeDelta );
  }

  void checkIfOffScreen(){
    if(meteorRect.top > game.screenSize.height){
      isDead = true;
    }
  }

}