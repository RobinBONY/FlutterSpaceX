import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_first_app/core/viewmodel/launch_pads_viewmodel.dart';
import 'package:provider/provider.dart';

class GMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (_) => LaunchPadsViewModel(),
        child: Consumer<LaunchPadsViewModel>(
            builder: (context, LaunchPadsViewModel model, child) => Scaffold(
                appBar: AppBar(
                  title: Text("Map"),
                  centerTitle: true,
                ),
                body: model.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(46.2, 5.2167),
                          zoom: 12,
                        ),
                        markers: model.markers,
                      ))));
  }
}
