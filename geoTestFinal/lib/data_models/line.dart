import 'dart:math';

import 'package:geoTestFinal/data_models/point.dart';

class Line{
  Point p1, p2;
  double a, b, c, xMin, xMax, yMin, yMax;
  int direction;

  Line({this.p1, this.p2}){
    this.xMin = min(p1.x, p2.x);
    this.xMax = max(p1.x, p2.x);
    this.yMin = min(p1.y, p2.y);
    this.yMax = max(p1.y, p2.y);

    this.a = p1.y - p2.y;
    this.b = p2.x - p1.x;
    this.c = (p1.x * p2.y) - (p1.y * p2.x);

    this.direction = getDirection(p1, p2);
  }

  printLine(){
    print('p1: ${this.p1.x}, ${this.p1.y}');
    print('p2: ${this.p2.x}, ${this.p2.y}');
    print('xMin: ${this.xMin}, xMax: ${this.xMax}');
    print('yMin: ${this.yMin}, yMax: ${this.yMax}');
    print('direction: ${this.direction}\n');
  }

  int getDirection(Point p1, Point p2){
    if(p1.x < p2.x){
      if(p1.y < p2.y) return 1;
      else if(p1.y > p2.y) return 2;
      else return 0;
    }else if (p1.x > p2.x){
      if(p1.y < p2.y) return 3;
      else if(p1.y > p2.y) return 4;
      else return 0;
    }else{
      if(p1.y < p2.y) return 5;
      else if(p1.y > p2.y) return 6;
      else return 7;
    }
  }
}