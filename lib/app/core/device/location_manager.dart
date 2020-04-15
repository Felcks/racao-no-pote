import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

class LocationManager {
  Location defaultLocation;
  Location userLocation;

  LocationManager({@required String defaultLocationName, @required String userLocationName}){
    this.defaultLocation = getLocation(defaultLocationName);
    this.userLocation = getLocation(userLocationName);
  }
}