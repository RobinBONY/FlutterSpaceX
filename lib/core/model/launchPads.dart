import 'package:json_annotation/json_annotation.dart';
import 'package:my_first_app/core/model/launchPad.dart';

part 'launchPads.g.dart';

@JsonSerializable(checked: true)
class LaunchPads {
  LaunchPad location;

  LaunchPads({this.location,});

  factory LaunchPads.fromJson(Map<String, dynamic> json) =>
      _$LaunchPadsFromJson(json);
}