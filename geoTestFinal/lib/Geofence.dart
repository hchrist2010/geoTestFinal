import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_models/point.dart';
import 'main.dart';

class Geofencing extends StatelessWidget {
  List<bool> inObjects = [];
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<Point>(context);
    for(int i = 0; i < objects.length; i++){
      inObjects.add(objects[i].isInside(Point(x: userLocation.x, y: userLocation.y)));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Geofencing Demo'),
        centerTitle: true,
      ),body: Center(
        child: Text('1: ${inObjects[0]}')
      )
    );
  }
}