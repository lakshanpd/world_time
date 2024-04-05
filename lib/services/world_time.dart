import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDay;

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url')); //Asia/Colombo
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      now = now.add(Duration(minutes: int.parse(offset.substring(4, 6))));

      isDay = now.hour > 6 && now.hour < 20 ? true : false;
      print('${now.hour}');
      time = DateFormat.jm().format(now);
    }

    catch (e) {
      print('Error cought: $e');
      time = 'data is not available';
    }

  }
}
