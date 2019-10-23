
import 'dart:ui';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class MeteorRocket{

  Rect meteorRect;
  Paint meteorPaint;
  final SpacePatrolGame game;
  bool isTap = false,isDrag = false;
  bool isDead=false;

  

  MeteorRocket({this.game,double xInitialPos,double yInitialPos}){
    
      meteorRect = Rect.fromLTWH(xInitialPos, yInitialPos, game.tileSize, game.tileSize);
    
      meteorPaint = Paint();
      meteorPaint.color = Color(0xffffffff);
      
    
  }

  void render(Canvas canvas){
      canvas.drawRect(meteorRect, meteorPaint);
  }

  void update(double timeDelta){
    checkIfOffScreen();
      meteorRect = meteorRect.translate(0, game.tileSize * 3 * timeDelta );
     
  }

  void checkIfOffScreen(){
    if(meteorRect.top > game.screenSize.height){
      print("dead meteor");
      isDead = true;
    }
  }

}