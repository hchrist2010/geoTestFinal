import 'package:geoTestFinal/data_models/child_object.dart';

import 'line.dart';
import 'point.dart';
import 'child_object.dart';

class ParentObject{
  List<ChildObject> childAssets = [];
  List<Point> points = [];
  List<Line> lines = [];

  void addPoint(Point p1){
    this.points.add(p1);
  }

  void createParentObject(){
    if(points.length > 0){
      for(int i = 0; i < points.length + 1; i++){
        lines.add(Line(p1: points[i % points.length], p2: points[(i + 1) % points.length]));
      }
    }
  }

  void printPoints(){
    for(int i = 0; i < points.length; i++){
      this.points[i].printPoint();
    }
  }

  void printLines(){
    for(int i = 0; i < lines.length; i++){
      this.lines[i].printLine();
    }
  }

  void clear(){
    childAssets = [];
    points = [];
    lines = [];
  }

  bool isInside(Point p1){
    int tmp1 = 0, tmp2 = 0;
    double x = p1.x;
    double y = p1.y;

    for(int i = 0; i < this.lines.length; i++){
      double a = this.lines[i].a;
      double b = this.lines[i].b;
      double c = this.lines[i].c;

      double xMin = this.lines[i].xMin;
      double xMax = this.lines[i].xMax;
      double yMin = this.lines[i].yMin;
      double yMax = this.lines[i].yMax;
      int direction = this.lines[i].direction;

      if(x < xMax){
        if(direction == 1 || direction == 3 || direction == 5){
          if(y <= yMax && y > yMin){
            if((a * x + b * y + c) >= 0){
              tmp1++;
            }
          }
        }else if(direction == 2 || direction == 4 || direction == 6){
          if(y < yMax && y >= yMin){
            if((a * x + b * y + c) <= 0){
              tmp1++;
            }
          }
        }
      }
      if(x > xMin){
        if(direction == 1 || direction == 3 || direction == 5){
          if(y <= yMax && y > yMin){
            if((a * x + b * y + c) <= 0){
              tmp2++;
            }
          }
        }else if(direction == 2 || direction == 4 || direction == 6){
          if(y < yMax && y >= yMin){
            if((a * x + b * y + c) >= 0){
              tmp2++;
            }
          }
        }
      }
    }

    tmp1 = tmp1 % 2;
    tmp2 = tmp2 % 2;

    if(tmp1 == 1 && tmp2 == 1) return true;
    else return false;
  }
}