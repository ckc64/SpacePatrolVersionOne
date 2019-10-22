
import 'dart:ui';
import 'package:spacepatrolv1/spacepatrolgame.dart';
import 'package:flutter/gestures.dart';

class SpaceRocket{

  Rect spaceRect;
  Paint spacePaint;
  final SpacePatrolGame game;
  bool isTap = false,isDrag = false,
  isDragLeft=false,isDragRight=false;
  double lastMovement;
  

  SpaceRocket({this.game,double xInitialPos,double yInitialPos}){
    
      spaceRect = Rect.fromLTWH(xInitialPos, yInitialPos, game.tileSize, game.tileSize);
      spacePaint = Paint();
      spacePaint.color = Color(0xff6ab04c);
    
  }

  void render(Canvas canvas){
      canvas.drawRect(spaceRect, spacePaint);
  }

  void update(double timeDelta){
    if(isTap){
      spaceRect = spaceRect.translate(0, game.tileSize * -24 * timeDelta );
      isTap = false;
      
    }
    
    if(isDrag){
  lastMovement = game.positionX;

      spaceRect = spaceRect.translate(0, game.positionY.floor()*1 *timeDelta );
      
      if(game.positionX < (game.screenSize.width/2)){
           spaceRect = spaceRect.translate((-game.tileSize)*3 *timeDelta, game.tileSize * -24 * timeDelta );
      }else{
        spaceRect = spaceRect.translate((game.tileSize)*3 *timeDelta, game.tileSize * -24 * timeDelta );
      }

   
      isDrag = false;
        lastMovement = game.positionX;
        print("last movement $lastMovement");

    }


    if(!isDrag){
       spaceRect = spaceRect.translate(0, game.tileSize * 1 * timeDelta );
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