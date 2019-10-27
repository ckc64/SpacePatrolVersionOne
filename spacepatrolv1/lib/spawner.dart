

import 'package:spacepatrolv1/meteors/meteor.dart';
import 'package:spacepatrolv1/planets/planets.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';

class MeteorSpawner{
  final SpacePatrolGame game;
  final int maxMeteorOnScreen = 7;
  final int maxSpawnInterval = 1500; //equivalent to 1000 = 1second
  final int minSpawnInterval = 250;
  final int intervalChange = 1;
  final int maxPlanetOnScreen = 3;
  final int maxPlanetSpawnInterval = 4000; //equivalent to 1000 = 1second

  int currentInterval;
  int nextSpawn;
  int nextSpawPlanet;
  int currentIntervalPlanet;

  MeteorSpawner(this.game){
      
      game.spawnMeteor();
      game.spawnPlanet();
  }

  void start(){

    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
    
    currentIntervalPlanet = maxPlanetSpawnInterval;
    nextSpawPlanet = DateTime.now().millisecondsSinceEpoch + currentIntervalPlanet;

    
  }

   void killAll() {
    game.meteorRocket.forEach((MeteorRocket meteorRocket) => meteorRocket.isDead = true);
    game.planets.forEach((Planets planets) => planets.isDead = true);
  }

  void update(double t){
       int nowTimestamp = DateTime.now().millisecondsSinceEpoch; //current time

    int meteorCount = 0;
    int planetCount = 0;

    game.meteorRocket.forEach((MeteorRocket meteorRocket){
        if(!meteorRocket.isDead) meteorCount+=1;
    });
    game.planets.forEach((Planets planets){
      if(!planets.isDead) planetCount+=1;
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


  //planetSpawner
     if (nowTimestamp >= nextSpawPlanet && planetCount < maxPlanetOnScreen) {
      game.spawnPlanet();
        

        if (currentIntervalPlanet > minSpawnInterval) {
          currentIntervalPlanet -= intervalChange;
          currentIntervalPlanet -= (currentIntervalPlanet * .02).toInt();
        }
       
      nextSpawPlanet = nowTimestamp + currentIntervalPlanet;
    }

  }

}