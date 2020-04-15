import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

class LocationManager {
  Location defaultLocation;

  LocationManager({@required String defaultLocationName}){
    this.defaultLocation = getLocation(defaultLocationName);
  }
}