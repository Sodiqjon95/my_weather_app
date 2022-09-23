import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather_app/presentation/tab_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Location handling side

  Location location = Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  late LocationData _locationData;

  void _init() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();

    await Future.delayed(const Duration(seconds: 2));

    if (_locationData != null) {
      print(
          "LATITUDE :${_locationData.latitude} AND LONGITUDE: ${_locationData.longitude}");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
        return TabBox(
          lat: _locationData.latitude!,
          lon: _locationData.longitude!,
        );
      }));
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF356973),
      body: SafeArea(
        child: Stack(
          children: [
            Lottie.asset("assets/lottie/windy-weather.json"),
            Positioned(
                child: Center(child: Lottie.asset("assets/lottie/93175-loading-lottie-animation.json")))
          ],
        ),
      ),
    );
  }
}
