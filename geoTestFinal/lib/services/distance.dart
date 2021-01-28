import 'dart:math';
import '../data_models/point.dart';

distance(Point p1, Point p2){
  double radiusM = 3958.8;
  double radiusKM = 6371;

  double dLat = degreesToRadians(p2.y - p1.y);
  double dLon = degreesToRadians(p2.x - p1.x);
  double lat1 = degreesToRadians(p1.y);
  double lat2 = degreesToRadians(p2.y);

  double a = pow(sin(dLat/2), 2) + pow(sin(dLon/2), 2) + cos(lat1) * cos(lat2);
  double c = 2 * atan2(sqrt(a), sqrt(1-a));
  return radiusKM * c;
}

double degreesToRadians(double degrees){
  return degrees * pi / 180;
}