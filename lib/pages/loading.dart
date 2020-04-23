import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: "Kolkata", flag: "India.png", urllocation: "Asia/Kolkata");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
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
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text("Loading"),
      ),
    );
  }
}
