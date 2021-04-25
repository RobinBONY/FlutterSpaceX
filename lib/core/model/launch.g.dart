// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return $checkedNew('Launch', json, () {
    final val = Launch(
      name: $checkedConvert(json, 'name', (v) => v as String),
      details: $checkedConvert(json, 'details', (v) => v as String),
      date_local: $checkedConvert(json, 'date_local',
          (v) => v == null ? null : DateTime.parse(v as String)),
      id: $checkedConvert(json, 'id', (v) => v as String),
      upcoming: $checkedConvert(json, 'upcoming', (v) => v as bool),
    );
    return val;
  });
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'date_local': instance.date_local?.toIso8601String(),
      'id': instance.id,
      'upcoming': instance.upcoming,
    };
