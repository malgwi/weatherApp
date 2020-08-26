import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  // Return a future void to allow the call to await the correct latitude and longitude
  Future getCurrentLocation() async {
    // By default Geolocator will use FusedLocationProviderClient on Android
    // when Google Play Services are available. It will fall back to LocationManager
    // when it is not available. You can override the behaviour by setting
    // forceAndroidLocationManager.
    Geolocator()..forceAndroidLocationManager = true;

    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      // catch exception
      print(e);
    }
  }

//  Future<void> getCurrentLocation() async {
//    try {
//      Position position = await Geolocator()
//          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//
//      latitude = position.latitude;
//      longitude = position.longitude;
//    } catch (e) {
//      print(e);
//    }
//  }
}
