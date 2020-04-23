import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class LocationSelect extends StatefulWidget {
  @override
  _LocationSelectState createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {

  List<WorldTime> locations = [
    WorldTime(urllocation: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(urllocation: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
    WorldTime(urllocation: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hong_kong.png'),
    WorldTime(urllocation: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urllocation: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(urllocation: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(urllocation: 'Asia/Taipei', location: 'Taipei', flag: 'taiwan.png'),
    WorldTime(urllocation: 'America/Phoenix', location: 'Phoenix', flag: 'usa.png'),
    WorldTime(urllocation: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    WorldTime(urllocation: 'America/Vancouver', location: 'Vancouver', flag: 'canada.png'),
    WorldTime(urllocation: 'America/Detroit', location: 'Detroit', flag: 'usa.png'),
    WorldTime(urllocation: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urllocation: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urllocation: 'America/Sao_Paulo', location: 'Sao Paulo', flag: 'brazil.png'),
    WorldTime(urllocation: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires', flag: 'argentina.png'),
    WorldTime(urllocation: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urllocation: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(urllocation: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(urllocation: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urllocation: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDay": instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Select a Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/flags/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
