

import 'package:spacepatrolv1/meteors/meteor.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class MeteorSpawner{
  final SpacePatrolGame game;
  final int maxMeteorOnScreen = 7;
  final int maxSpawnInterval = 1500; //equivalent to 1000 = 1second
  final int minSpawnInterval = 250;
  final int intervalChange = 1;

  int currentInterval;
  int nextSpawn;

  MeteorSpawner(this.game){
      
      game.spawnMeteor();
  }

  void start(){

    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

   void killAll() {
    game.meteorRocket.forEach((MeteorRocket meteorRocket) => meteorRocket.isDead = true);
  }

  void update(double t){
       int nowTimestamp = DateTime.now().millisecondsSinceEpoch; //current time

    int meteorCount = 0;

    game.meteorRocket.forEach((MeteorRocket meteorRocket){
        if(!meteorRocket.isDead) meteorCount+=1;
    });

              //if current time passed 3secs and flies are not more thant 7
    if (nowTimestamp >= nextSpawn && meteorCount < maxMeteorOnScreen) {
      game.spawnMeteor();
        //if currentInterval(3000) is still greater than minSpawnInterval(250)
        //currentInterval will subtract 3 then
        //current interval will change it value

        if (currentInterval > minSpawnInterval) {
          currentInterval -= intervalChange;
          currentInterval -= (currentInterval * .02).toInt();
        }
        //nextSpawn is now the current add currentInterval
      nextSpawn = nowTimestamp + currentInterval;
    }

  }

}