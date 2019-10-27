
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/planets/planets.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class PlanetCompOne extends Planets{

 
  PlanetCompOne(SpacePatrolGame game,double x,double y) : super(game){
     planetRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
      planetSprite = List();
      planetSprite.add(Sprite('planets/planet-1.png'));
  }

}

class PlanetCompTwo extends Planets{

 
  PlanetCompTwo(SpacePatrolGame game,double x,double y) : super(game){
     planetRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
      planetSprite = List();
      planetSprite.add(Sprite('planets/planet-2.png'));
  }

}

class PlanetCompThree extends Planets{
 
 
  PlanetCompThree(SpacePatrolGame game,double x,double y) : super(game){
     planetRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
      planetSprite = List();
      planetSprite.add(Sprite('planets/planet-3.png'));
  }

}

class PlanetCompFour extends Planets{

 
  PlanetCompFour(SpacePatrolGame game,double x,double y) : super(game){
     planetRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
      planetSprite = List();
      planetSprite.add(Sprite('planets/planet-4.png'));
  }

}

class PlanetCompFive extends Planets{

 
  PlanetCompFive(SpacePatrolGame game,double x,double y) : super(game){
     planetRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
      planetSprite = List();
      planetSprite.add(Sprite('planets/planet-5.png'));
  }

}