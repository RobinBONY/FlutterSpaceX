import 'package:flutter/material.dart';
import 'package:my_first_app/core/viewmodel/launch_viewmodel.dart';
import 'package:my_first_app/ui/gmapPage.dart';
import 'package:my_first_app/ui/historyPage.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'detailsPage.dart';
import 'historyPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => LaunchViewModel(),
      child: Consumer<LaunchViewModel>(
        builder: (context, LaunchViewModel model, child) => Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              centerTitle: true,
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => History()));
                    },
                    child: Icon(Icons.history, color: Colors.white))
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.map),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GMap()));
              },
            ),
            body: Container(
              height: size.height,
              child: Column(
                children: <Widget>[
                  model.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : MaterialBanner(
                          backgroundColor: Colors.indigoAccent,
                          leading:
                              Icon(Icons.alarm, color: Colors.white, size: 28),
                          content: Column(
                            children: [
                              Text("Prochain lancement dans : "),
                              SlideCountdownClock(
                                duration: model.nextLaunch,
                                separator: ':',
                                textStyle: TextStyle(fontSize: 25),
                                shouldShowDays: true,
                              )
                            ],
                          ),
                          actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                launch: model.launches[0])));
                                  },
                                  child: Text("Details", style: whiteText))
                            ]),
                  Expanded(
                    child: model.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemBuilder: (context, position) => Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      model.launches[position].upcoming
                                          ? Icon(Icons.airplanemode_active)
                                          : Icon(Icons.airplanemode_inactive),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            model.launches[position].name,
                                            style: const TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            model.launches[position].id,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            DateFormat.yMMMMd().format(model
                                                .launches[position].date_local),
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      IconButton(
                                          color: Colors.orange,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Details(
                                                            launch: model
                                                                    .launches[
                                                                position])));
                                          },
                                          icon: Icon(Icons.arrow_forward)),
                                    ])),
                            itemCount: model.launches.length,
                          ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
