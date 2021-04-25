import 'package:flutter/material.dart';
import 'package:my_first_app/core/viewmodel/history_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'detailsPage.dart';

class History extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return ChangeNotifierProvider(
      create: (_) => HistoryViewModel(),
      child: Consumer<HistoryViewModel>(
        builder: (context, HistoryViewModel model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Historique"),
              centerTitle: true,
              
            ),
            body: Container(
              height: size.height,
              child: Column(
                children: <Widget>[
                  
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
                                model.history[position].upcoming
                                    ? Icon(Icons.airplanemode_active)
                                    : Icon(Icons.airplanemode_inactive),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      model.history[position].name,
                                      style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      model.history[position].id,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      DateFormat.yMMMMd().format(model
                                          .history[position].date_local),
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
                                                          .history[
                                                      position])));
                                    },
                                    icon: Icon(Icons.arrow_forward)),
                              ])),
                      itemCount: model.history.length,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
