import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String time;
  String flag;
  String urllocation;

  WorldTime({this.location, this.flag, this.urllocation});

  Future<void> getTime() async {

    try {
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/$urllocation");
      Map data = jsonDecode(response.body);
//   print(data);
      String datetime = data["datetime"];
      String offsethours = data["utc_offset"].substring(1, 3);
//  print(offsethours);
      String offsetmins = data["utc_offset"].substring(4, 6);
//  print(offsetmins);
      DateTime actualtime = DateTime.parse(datetime);
      actualtime = actualtime.add(Duration(hours: int.parse(offsethours)));
      actualtime = actualtime.add(Duration(minutes: int.parse(offsetmins)));

      time = actualtime.toString();
//    print(time);
    }
    catch (error) {
      print(error);
      time = "There was an error getting time";
    }
  }
}