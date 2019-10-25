
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacepatrolv1/meteors/meteor.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class MeteorCompOne extends MeteorRocket{
   double get speed => game.tileSize * 3;
 
  MeteorCompOne(SpacePatrolGame game,double x,double y) : super(game){
     meteorRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
      meteorSprite = List();
      meteorSprite.add(Sprite('meteors/meteor-1.png'));
  }

}

class MeteorCompTwo extends MeteorRocket{
   double get speed => game.tileSize * 3;
 
  MeteorCompTwo(SpacePatrolGame game,double x,double y) : super(game){
     meteorRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
      meteorSprite = List();
      meteorSprite.add(Sprite('meteors/meteor-2.png'));
  }

}

class MeteorCompThree extends MeteorRocket{
   double get speed => game.tileSize * 3;
 
  MeteorCompThree(SpacePatrolGame game,double x,double y) : super(game){
     meteorRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
      meteorSprite = List();
      meteorSprite.add(Sprite('meteors/meteor-3.png'));
  }

}

class MeteorCompFour extends MeteorRocket{
   double get speed => game.tileSize * 3;
 
  MeteorCompFour(SpacePatrolGame game,double x,double y) : super(game){
     meteorRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
      meteorSprite = List();
      meteorSprite.add(Sprite('meteors/meteor-4.png'));
  }

}

class MeteorCompFive extends MeteorRocket{
   double get speed => game.tileSize * 3;
 
  MeteorCompFive(SpacePatrolGame game,double x,double y) : super(game){
     meteorRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
      meteorSprite = List();
      meteorSprite.add(Sprite('meteors/meteor-5.png'));
  }

}