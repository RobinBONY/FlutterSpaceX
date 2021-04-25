import 'package:json_annotation/json_annotation.dart';

part 'launchPad.g.dart';

@JsonSerializable(checked: true)
class LaunchPad {
  String name;
  String region;
  double latitude;
  double longitude;

  LaunchPad({this.name, this.region, this.latitude, this.longitude});

  factory LaunchPad.fromJson(Map<String, dynamic> json) =>
      _$LaunchPadFromJson(json);
}
