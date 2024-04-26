import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // The user denied location permissions. You can handle this case here.
      print("Location permissions denied.");
    } else if (permission == LocationPermission.deniedForever) {
      // The user denied location permissions permanently. You can handle this case here.
      print("Location permissions denied forever.");
    } else {
      // Location permissions granted. You can now proceed to get the location.
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      print(position);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: MaterialButton(
        //     onPressed: () {
        //       //Get the current location
        //       getLocation();
        //     },
        //     color: Colors.blue,
        //     child: const Text("Get Location"),
        //   ),
        // ),
        );
  }
}
