import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_first_app/app/locator.dart';
import 'package:my_first_app/core/api/api.dart';
import 'package:my_first_app/core/model/launch.dart';
import 'package:my_first_app/core/model/launchPad.dart';
import 'package:my_first_app/core/model/launchPads.dart';

class LaunchPadsViewModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<LaunchPads> launchPads = [];

  Set<Marker> markers = HashSet<Marker>();

  // The view is loading by default, waiting for API call to succeed
  bool isLoading = true;

  LaunchPadsViewModel() {
    loadData();
  }

  void loadData() async {
    try {
      var response = await _api.getLaunchPads();
      launchPads.addAll(List<LaunchPads>.from(
          response.data.map((item) => LaunchPads.fromJson(item))));
    } catch (error, stackTrace) {
      print(stackTrace);
    }
    isLoading = false;

    int markerid = 0;

    for (LaunchPads l in launchPads) {
      markerid++;
      markers.add(Marker(
          markerId: MarkerId(markerid.toString()),
          position: LatLng(l.location.latitude, l.location.longitude),
          infoWindow:
              InfoWindow(title: l.location.name, snippet: l.location.region)));
    }

    notifyListeners();
  }
}
