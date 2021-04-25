// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchPad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchPad _$LaunchPadFromJson(Map<String, dynamic> json) {
  return $checkedNew('LaunchPad', json, () {
    final val = LaunchPad(
      name: $checkedConvert(json, 'name', (v) => v as String),
      region: $checkedConvert(json, 'region', (v) => v as String),
      latitude:
          $checkedConvert(json, 'latitude', (v) => (v as num)?.toDouble()),
      longitude:
          $checkedConvert(json, 'longitude', (v) => (v as num)?.toDouble()),
    );
    return val;
  });
}

Map<String, dynamic> _$LaunchPadToJson(LaunchPad instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
