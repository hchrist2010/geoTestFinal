import 'package:flutter/material.dart';
import 'package:geoTestFinal/data_models/parent_object.dart';
import 'package:provider/provider.dart';

import 'data_models/child_object.dart';
import 'data_models/line.dart';
import 'data_models/point.dart';
import 'services/location_service.dart';
import 'Geofence.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //initTestObject();
    Point userLocation;
        return StreamProvider<Point>.value(
          initialData: Point(),
          value: LocationService().locationStream,
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              routes: {
                '/': (context) => HomeView(),
                'GeoFencing': (context) => Geofencing(),
          },
      )
    );
  }
}

Point point1 = Point(x: -5, y: 5);
Point point2 = Point(x: 5, y: 5);
Point point3 = Point(x: 5, y: -5);
Point point4 = Point(x: -5, y: -5);

Point userLoc1 = Point(x: 0, y: 0);
Point userLoc2 = Point(x: 0, y: 6);

ParentObject p1 = ParentObject();

List<ParentObject> objects = [];

void initObject(){
  p1.addPoint(point1);
  ChildObject chobj = ChildObject(location: Point(x: -123.27138696, y: 44.5582042));
  print('check: ');print(chobj.getDistance(Point(x: -123.27138696, y: 44.5582042),Point(x: -123.27138697, y: 44.582042)));
  p1.addPoint(point2);
  p1.addPoint(point3);
  p1.addPoint(point4);
  p1.createParentObject();
  print(p1.isInside(userLoc1));
  print(p1.isInside(userLoc2));
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParentObject obj = ParentObject();
    initObject();
    var userLocation = Provider.of<Point>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Geofencing test'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Location: Long${userLocation?.x}\t\tLat: ${userLocation?.y}'),

            MaterialButton(onPressed: (){
              obj.addPoint(Point(x: userLocation.x, y: userLocation.y));
            },
              child: Text('Add Point'),
              color: Colors.blue,
            ),

            MaterialButton(onPressed: (){
              obj.createParentObject();
              objects.add(obj);
              //obj = ParentObject();
            },
              child: Text('Create Object'),
              color: Colors.blue,
            ),

            MaterialButton(onPressed: (){
                Point currentLocation = Point(
                  x: userLocation.x,
                  y: userLocation.y
                );
                //print(obj.isInside(currentLocation));
                Navigator.pushNamed(context, 'GeoFencing');
              },
                child: Text('GeoFence'),
                color: Colors.blue,
              ),

              MaterialButton(onPressed: (){
                for(int i = 0; i < objects.length; i++){
                  objects[i].printPoints();
                }
              },
                child: Text('Print Points'),
                color: Colors.blue,
              ),
          ],
        )
      )
    );
  }
}