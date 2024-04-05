import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  late WorldTime selected_location;
  List<WorldTime> locations = [
    WorldTime('Colombo', 'sri_lanka.png', 'Asia/Colombo'),
    WorldTime('London', 'uk.jpg', 'Europe/London'),
    WorldTime('Rome', 'italy.jpg', 'Europe/Rome'),
    WorldTime('New York', 'america.jpg', 'America/New_York'),
    WorldTime('Canberra', 'australia.png', 'Australia/Canberra')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'choose a location',
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () async {
                    WorldTime instance = locations[index];
                    await instance.getTime();
                    Navigator.pushReplacementNamed(context, '/home', arguments: {
                      'location': instance.location,
                      'time': instance.time,
                      'flag': instance.flag,
                      'isDay': instance.isDay
                    });
                  },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
