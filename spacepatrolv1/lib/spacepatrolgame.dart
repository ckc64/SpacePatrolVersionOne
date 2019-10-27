
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:spacepatrolv1/bg/cosmos.dart';
import 'package:spacepatrolv1/character/spacerocket.dart';
import 'package:flutter/gestures.dart';
import 'package:spacepatrolv1/how_to_play.dart';
import 'package:spacepatrolv1/meteors/meteor.dart';
import 'package:spacepatrolv1/meteors/meteorComponent.dart';
import 'package:spacepatrolv1/planets/planetComponent.dart';
import 'package:spacepatrolv1/planets/planets.dart';
import 'dart:math';

import 'package:spacepatrolv1/spawner.dart';
import 'package:spacepatrolv1/view.dart';
import 'package:spacepatrolv1/views/home_view.dart';
import 'package:spacepatrolv1/startbutton.dart';

import 'character/rocket.dart';


class SpacePatrolGame extends Game{

  Size screenSize;
  double tileSize;
 List<SpaceRocket> spaceRocket;
 List<MeteorRocket> meteorRocket;
 List<Planets>planets;
 Rect bgRect;
  double positionX,positionY;
  double tapPosition;
  Random rnd;
  MeteorSpawner meteorSpawner;
  Cosmos bg;
  MeteorRocket meteor;
  double randomXpos;

  View activeView = View.home;
  HomeView homeView;
  StartButton startButton;
  HowToPlay howToPlay;
  bool isHandled =false;


  SpacePatrolGame(){
      initialize();
  }

  void initialize() async{
    spaceRocket = List<SpaceRocket>();
    meteorRocket = List<MeteorRocket>();
    planets = List<Planets>();
    meteor = MeteorRocket(this);
    rnd = Random();
    resize(await Flame.util.initialDimensions());
        tapPosition = (screenSize.width / 2)-25;
        bg = Cosmos(this);
        homeView = HomeView(this);
        startButton = StartButton(this);
        howToPlay = HowToPlay(this);
    spawnRocket();
    meteorSpawner = MeteorSpawner(this);
    this.meteorSpawner.start(); //with planetSpawner
     randomXpos = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
  
  }
double initPositionX,initPositionY;
  void spawnRocket(){
    //   spaceRocket.add(SpaceRocket(game: this,
    //   xInitialPos: (screenSize.width / 2)-25,
    //   yInitialPos: (screenSize.height / 2)
    // ));
    initPositionX = (screenSize.width / 2)-25;
    initPositionY = (screenSize.height / 2);
    spaceRocket.add(Rocket(this, initPositionX,  initPositionY,meteor));
  }
  void spawnMeteor(){
    randomXpos = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    switch(rnd.nextInt(5)){

      case 0:
          meteorRocket.add(MeteorCompOne(this,randomXpos,-10));
          break;
      case 1:
          meteorRocket.add(MeteorCompTwo(this,randomXpos,-10));
          break;
      case 2:
          meteorRocket.add(MeteorCompThree(this,randomXpos,-10));
          break;
      case 3:
          meteorRocket.add(MeteorCompFour(this,randomXpos,-10));
          break;
      case 4:
          meteorRocket.add(MeteorCompFive(this,randomXpos,-10));
          break;
    }
     
  }

  void spawnPlanet(){
         switch(rnd.nextInt(5)){

      case 0:
          planets.add(PlanetCompOne(this,-5,-10));
          break;
      case 1:
           planets.add(PlanetCompTwo(this,350,-10));
          break;
      case 2:
           planets.add(PlanetCompThree(this,10,-10));
          break;
      case 3:
          planets.add(PlanetCompFour(this,350,-10));
          break;
      case 4:
           planets.add(PlanetCompFive(this,-5,-10));
          break;
    }
  }
  

  @override
  void render(Canvas canvas) {
    
      bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
      Paint bgPaint = Paint();
      bgPaint.color=Color(0xff000000);
      canvas.drawRect(bgRect, bgPaint);
      bg.render(canvas);

      spaceRocket.forEach((SpaceRocket spaceR)=>spaceR.render(canvas));
      meteorRocket.forEach((MeteorRocket meteorR)=>meteorR.render(canvas));
      planets.forEach((Planets planets) => planets.render(canvas));

      
      if (activeView == View.home) homeView.render(canvas);
      if (activeView == View.home || activeView == View.lost) {
        startButton.render(canvas);
      }
      if(activeView==View.howtoplay){
        howToPlay.render(canvas);
      }

     
      
  }

  @override
  void update(double t) {
    spaceRocket.forEach((SpaceRocket spaceR)=>spaceR.update(t));  
    meteorRocket.forEach((MeteorRocket meteorR)=>meteorR.update(t)); 
    planets.forEach((Planets planets) => planets.update(t));
    meteorSpawner.update(t);
  }

  void resize(Size size){
      screenSize = size;
      tileSize = screenSize.width/9;
  }

  @override
  void onTapDown(TapDownDetails details) {

    // TODO: implement onTapDown

    super.onTapDown(details);

    if (!isHandled && startButton.rect.contains(details.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
          startButton.onTapDown();
          isHandled = true;
      }
    }

    if(!isHandled && bgRect.contains(details.globalPosition)){
        if(activeView == View.howtoplay){
            howToPlay.onTapDown();
            isHandled = true;
        }
    }


    if(!isHandled){
        spaceRocket.forEach((SpaceRocket spaceRocket){
        if(bgRect.contains(details.globalPosition)){
          tapPosition = details.globalPosition.dx;
            spaceRocket.onTapDown();
            
        }
      });
    }
  }

  void onUpdate(DragUpdateDetails details){
  
       spaceRocket.forEach((SpaceRocket spaceRocket){
        if(bgRect.contains(details.globalPosition)){
          positionX = details.globalPosition.dx;
          positionY = details.globalPosition.dy;
            spaceRocket.onDown();

      
        }
    
      });
      print("Drag Position X ${positionX.floor()}");
      //print(positionY);
     

  }

  

}