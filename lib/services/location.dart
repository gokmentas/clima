import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // The user denied location permissions. You can handle this case here.
      print("Location permissions denied.");
    } else if (permission == LocationPermission.deniedForever) {
      // The user denied location permissions permanently. You can handle this case here.
      print("Location permissions denied forever.");
    } else {
      // Location permissions granted. You can now proceed to get the location.
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: true,
        );
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        print(e);
      }
    }
  }
}
