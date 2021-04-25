import 'package:flutter/material.dart';
import 'package:my_first_app/core/model/launch.dart';

import 'package:intl/intl.dart';

class Details extends StatelessWidget {
  Details({Key key, this.launch}) : super(key: key);

  final Launch launch;

  TextStyle titleStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  TextStyle subtitleStyle = TextStyle(fontSize: 12);
  TextStyle textStyle = TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Column(children: <Widget>[
              Text(launch.name, style: titleStyle),
              Text(launch.id, style: subtitleStyle),
            ]),
          ),
          Column(children: <Widget>[
            Text(DateFormat.yMMMMd().format(launch.date_local),
                style: titleStyle),
            Row(
              children: [
                Text("Lancement à venir : ", style: textStyle),
                launch.upcoming
                    ? Icon(Icons.airplanemode_active)
                    : Icon(Icons.airplanemode_inactive)
              ],
            )
          ]),
          Column(
            children: [
              Row(
                children: [Text("Details : ", style: textStyle)],
              ),
              Text(launch.details != null ? launch.details : "",
                  style: textStyle, textAlign: TextAlign.justify, )
            ],
          )
        ],
      ),
    );
  }
}
