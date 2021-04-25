

import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable(checked: true)
class Launch {
  String name;
  String details;
  DateTime date_local;
  String id;
  bool upcoming;


  Launch({this.name, this.details, this.date_local, this.id, this.upcoming});

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
}