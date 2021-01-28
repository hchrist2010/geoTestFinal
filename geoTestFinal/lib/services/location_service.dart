import 'dart:async';
import 'package:location/location.dart';
import '../data_models/point.dart';

class LocationService {
  Point _currentLocation;

  var location = Location();

  Stream<Point> getLocation() async*{
    try {
      var userLocation = await location.getLocation();
      _currentLocation = Point(
        y: userLocation.latitude,
        x: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    yield _currentLocation;
  }

  StreamController<Point> _locationController =
      StreamController<Point>.broadcast();

  Stream<Point> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) {
      if (granted != null) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(Point(
              y: locationData.latitude,
              x: locationData.longitude,
            ));
          }
        });
      }
    });
  }
}

