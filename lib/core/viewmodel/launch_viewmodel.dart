import 'package:flutter/material.dart';
import 'package:my_first_app/app/locator.dart';
import 'package:my_first_app/core/api/api.dart';
import 'package:my_first_app/core/model/launch.dart';

class LaunchViewModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Launch> launches = [];
  Duration nextLaunch = Duration(hours: 0);

  DateTime now = DateTime.now();

  // The view is loading by default, waiting for API call to succeed
  bool isLoading = true;

  LaunchViewModel() {
    loadData();
  }

  void loadData() async {
    try {
      var response = await _api.getUpcomingLaunches();
      launches.addAll(List<Launch>.from(
          response.data.map((item) => Launch.fromJson(item))));
    } catch (error, stackTrace) {
      print(stackTrace);
    }
    isLoading = false;

    RegExp regExp = RegExp(r'.{0,20}');

    for (Launch l in launches){
      var match = regExp.firstMatch(l.name);
      l.name = match.group(0);
    }

    var diff = DateTime.now().difference(launches[0].date_local);

    diff = diff * -1;
    nextLaunch = Duration(hours: diff.inHours);

    notifyListeners();
  }
}
