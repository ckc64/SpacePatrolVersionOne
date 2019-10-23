import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacepatrolv1/spacepatrolgame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';

void main() async {
  Util fUtil = Util();
  await fUtil.fullScreen();
  await fUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'spacerocket/space-rocket-1.png',
    'spacerocket/space-rocket-2.png',
    'spacerocket/space-rocket-3.png',
    'spacerocket/space-rocket-4.png',
    'spacerocket/space-rocket-5.png',
    'spacerocket/space-rocket-6.png',
    'spacerocket/space-rocket-7.png',
    'spacerocket/space-rocket-8.png'
  ]);

  SpacePatrolGame spg = SpacePatrolGame();
  runApp(spg.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = spg.onTapDown;
  tapper.onTapUp = spg.onTapUp;
  fUtil.addGestureRecognizer(tapper);
 
  PanGestureRecognizer panGestureRecognizer = PanGestureRecognizer();
  panGestureRecognizer.onUpdate = spg.onUpdate;
  
  fUtil.addGestureRecognizer(panGestureRecognizer);

  
}

