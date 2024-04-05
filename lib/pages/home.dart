import 'package:flutter/material.dart';

import 'choose_location.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    String back_img = data['isDay'] ? 'day.jpg' : 'night.jpg';
    Color txt_color = data['isDay'] ? Colors.black : Colors.white;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$back_img"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 200.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseLocation()),
                      );
                    },
                    icon: Icon(Icons.edit_location, color: txt_color,),
                    label: Text(
                      'edit location',
                      style: TextStyle(color: txt_color),
                    ))
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              data['location'],
              style: TextStyle(fontSize: 34.0, color: txt_color),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              data['time'],
              style: TextStyle(fontSize: 66.0, color: txt_color),
            )
          ],
        ),
      ),
    );
  }
}
