import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: "Kolkata", flag: "India.png", urllocation: "Asia/Kolkata");
    await instance.getTime();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDay": instance.isDay,
    });
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}
