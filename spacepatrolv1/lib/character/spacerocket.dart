
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/meteors/meteorComponent.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';
import 'package:spacepatrolv1/meteors/meteor.dart';
import 'dart:math' as math;

class SpaceRocket{

  Rect spaceRect;
  Paint spacePaint;
  final SpacePatrolGame game;
  bool isTap = false,isDrag = false;
  List<Sprite> spaceRocketSprite;
  double spaceRocketSpriteIndex = 0;
  final MeteorRocket meteor;
  bool fallRocket = false;
  Sprite fallenRocketSprite;

  SpaceRocket(this.game, this.meteor);
  
    
  void render(Canvas canvas){
      if(fallRocket){
          fallenRocketSprite.renderRect(canvas, spaceRect.inflate(3));
      }else{
      spaceRocketSprite[spaceRocketSpriteIndex.toInt()].renderRect(canvas, spaceRect.inflate(5));
      }
      
      
  }

  void update(double timeDelta){

       game.meteorRocket.forEach((MeteorRocket meteorR){
          bool isDead = spaceRect.contains(meteorR.meteorRect.bottomLeft) || 
          spaceRect.contains(meteorR.meteorRect.bottomRight) || 
          spaceRect.contains(meteorR.meteorRect.bottomCenter);
          if(isDead){
              fallRocket = true;
             
          }

       });

      spaceRocketSpriteIndex +=5 * timeDelta;
      if(spaceRocketSpriteIndex >= 8){
        spaceRocketSpriteIndex -=8;
      }
    

    if(isDrag){
 
spaceRect = spaceRect.translate(0, game.tileSize * 1 * timeDelta );
     
       if(spaceRect.left < 0){
              spaceRect = spaceRect.translate((game.tileSize), game.tileSize * -16 * timeDelta);
          }

          if(spaceRect.right > game.screenSize.width){
              spaceRect = spaceRect.translate((-game.tileSize), game.tileSize * -16 * timeDelta);
          }
      if(game.positionX < game.tapPosition){
      
        
           spaceRect = spaceRect.translate((-game.tileSize)*2 *timeDelta, game.tileSize * -16 * timeDelta);
         
      }else{
        spaceRect = spaceRect.translate((game.tileSize)*2 *timeDelta, game.tileSize * -16 * timeDelta );
      }

      isDrag = false;
    }

    if(!isDrag){
      if(fallRocket){
           spaceRect = spaceRect.translate(0, game.tileSize * 4 * timeDelta );
      }
       spaceRect = spaceRect.translate(0, game.tileSize * 2 * timeDelta );
    }
    

  }



  void onTapDown(){
    isTap = true;
    isDrag = false;
  }

  void onDown(){
      isDrag=true;

  }



}