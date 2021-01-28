import 'package:geoTestFinal/data_models/point.dart';
import 'package:geoTestFinal/services/distance.dart';

class ChildObject{
  Point location;

  ChildObject({location});

  double getDistance(Point location, Point p2){
    return distance(location, p2);
  }
}