import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//    print(data);

//    String bgImage = data["isDay"] ? "day2.jpg" : "night2.jpg";
//    Color bgColor = data["isDay"] ? Colors.blue : Colors.indigo[700];
    String bgImage = data["isDay"] ? "unsplashday.jpg" : "unsplashnight.jpg";
    Color bgColor = data["isDay"] ? Colors.blue[600] : Colors.cyan[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/$bgImage"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, "/locationselect");
                     setState(() {
                       data = {
                         "location": result["location"],
                         "flag": result["flag"],
                         "time": result["time"],
                         "isDay": result["isDay"],
                       };
                     });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                        "Edit Location",
                      style: TextStyle(
                        color: Colors.grey[300]
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data["location"],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data["time"],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
