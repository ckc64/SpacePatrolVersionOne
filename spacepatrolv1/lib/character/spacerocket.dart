
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class SpaceRocket{

  Rect spaceRect;
  Paint spacePaint;
  final SpacePatrolGame game;
  bool isTap = false,isDrag = false;
  List<Sprite> spaceRocketSprite;
  double spaceRocketSpriteIndex = 0;
  bool isDead=false;

  SpaceRocket(this.game);
    
      // spaceRect = Rect.fromLTWH(xInitialPos, yInitialPos, 20,60);
    
      // spacePaint = Paint();
      // spacePaint.color = Color(0xff6ab04c);
    
  

  void render(Canvas canvas){
      spaceRocketSprite[spaceRocketSpriteIndex.toInt()].renderRect(canvas, spaceRect.inflate(5));
   
      
      
  }

  void update(double timeDelta){

    if(isDead){

    }else{
      spaceRocketSpriteIndex +=5 * timeDelta;
      if(spaceRocketSpriteIndex >= 8){
        spaceRocketSpriteIndex -=8;
      }
    }

    if(isDrag){
 
      spaceRect = spaceRect.translate(0, game.positionY.floor()*1 *timeDelta );
        print("Left : ${spaceRect.left}");
        print("Right : ${spaceRect.right}");
     
       if(spaceRect.left <= 0){
              spaceRect = spaceRect.translate((game.tileSize), game.tileSize * -16 * timeDelta);
          }
      if(game.positionX < game.tapPosition){
      
        
           spaceRect = spaceRect.translate((-game.tileSize)*3 *timeDelta, game.tileSize * -16 * timeDelta);
         
      }else{
        spaceRect = spaceRect.translate((game.tileSize)*3 *timeDelta, game.tileSize * -16 * timeDelta );
      }

      isDrag = false;
    }

    if(!isDrag){
       spaceRect = spaceRect.translate(0, game.tileSize * 2 * timeDelta );
    }
    

  }

  void onTapDown(){
    isTap = true;
    isDrag = false;
  }

  void onDown(){
      isDrag=true;
      //isTap=false;
  }

}