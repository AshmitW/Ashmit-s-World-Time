import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flag;
  String urllocation;
  bool isDay;

  WorldTime({this.location, this.flag, this.urllocation});

  Future<void> getTime() async {

    try {
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/$urllocation");
      Map data = jsonDecode(response.body);
//   print(data);
      String datetime = data["datetime"];
      String operation = data["utc_offset"].substring(0, 1);
//      print(operation);
      String offsethours = data["utc_offset"].substring(1, 3);
//  print(offsethours);
      String offsetmins = data["utc_offset"].substring(4, 6);
//  print(offsetmins);
      DateTime actualtime = DateTime.parse(datetime);
      if (operation == "+") {
        actualtime = actualtime.add(Duration(hours: int.parse(offsethours)));
        actualtime = actualtime.add(Duration(minutes: int.parse(offsetmins)));
      }
      else {
        actualtime = actualtime.subtract(Duration(hours: int.parse(offsethours)));
        actualtime = actualtime.subtract(Duration(minutes: int.parse(offsetmins)));
      }
      isDay = actualtime.hour > 5 && actualtime.hour < 18;
      time = DateFormat.jm().format(actualtime);
//    print(time);
    }
    catch (error) {
      print(error);
      time = "There was an error getting time";
    }
  }
}