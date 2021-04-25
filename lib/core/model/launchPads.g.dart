// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchPads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchPads _$LaunchPadsFromJson(Map<String, dynamic> json) {
  return $checkedNew('LaunchPads', json, () {
    final val = LaunchPads(
      location: $checkedConvert(
          json,
          'location',
          (v) =>
              v == null ? null : LaunchPad.fromJson(v as Map<String, dynamic>)),
    );
    return val;
  });
}

Map<String, dynamic> _$LaunchPadsToJson(LaunchPads instance) =>
    <String, dynamic>{
      'location': instance.location,
    };
