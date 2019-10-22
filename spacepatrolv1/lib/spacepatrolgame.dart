
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:spacepatrolv1/character/spacerocket.dart';
import 'package:flutter/gestures.dart';


class SpacePatrolGame extends Game{

  Size screenSize;
  double tileSize;
 List<SpaceRocket> spaceRocket;
 Rect bgRect;
double positionX,positionY;
  SpacePatrolGame(){
      initialize();
  }

  void initialize() async{
    spaceRocket = List<SpaceRocket>();
    resize(await Flame.util.initialDimensions());
    spawnRocket();
  }

  void spawnRocket(){
      spaceRocket.add(SpaceRocket(game: this,
      xInitialPos: (screenSize.width / 2)-25,
      yInitialPos: (screenSize.height / 2)
    ));
  }

  @override
  void render(Canvas canvas) {
      bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
      Paint bgPaint = Paint();
      bgPaint.color=Color(0xff000000);
      canvas.drawRect(bgRect, bgPaint);

      spaceRocket.forEach((SpaceRocket spaceR)=>spaceR.render(canvas));
  }

  @override
  void update(double t) {
    spaceRocket.forEach((SpaceRocket spaceR)=>spaceR.update(t));  
  }

  void resize(Size size){
      screenSize = size;
      tileSize = screenSize.width/9;
  }

  @override
  void onTapDown(TapDownDetails details) {
    // TODO: implement onTapDown
    super.onTapDown(details);
      spaceRocket.forEach((SpaceRocket spaceRocket){
        if(bgRect.contains(details.globalPosition)){
            spaceRocket.onTapDown();
        }
      });
  }


  void onUpdate(DragUpdateDetails details){
       spaceRocket.forEach((SpaceRocket spaceRocket){
        if(bgRect.contains(details.globalPosition)){
          positionX = details.globalPosition.dx;
          positionY = details.globalPosition.dy;
            spaceRocket.onDown();
        }
      });
      print(positionX.floor());
      //print(positionY);
     

  }

  

}