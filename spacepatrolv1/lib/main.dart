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

  SpacePatrolGame spg = SpacePatrolGame();
  runApp(spg.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = spg.onTapDown;
  fUtil.addGestureRecognizer(tapper);
 
  PanGestureRecognizer panGestureRecognizer = PanGestureRecognizer();
  panGestureRecognizer.onUpdate = spg.onUpdate;
  
  fUtil.addGestureRecognizer(panGestureRecognizer);

  
}

