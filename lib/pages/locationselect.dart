import 'package:flutter/material.dart';

class LocationSelect extends StatefulWidget {
  @override
  _LocationSelectState createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[200],
        title: Text("Select a Location"),
        centerTitle: true,
      ),
      body: Text("Choose Location Screen"),
    );
  }
}
