// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_task22_proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadTask22ProofResponse _$LoadTask22ProofResponseFromJson(
        Map<String, dynamic> json) =>
    LoadTask22ProofResponse(
      date_time: json['date_time'] == null
          ? null
          : DateTime.parse(json['date_time'] as String),
      daily_proof: (json['daily_proof'] as List<dynamic>?)
          ?.map((e) =>
              LoadTask221ProofDailyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoadTask22ProofResponseToJson(
        LoadTask22ProofResponse instance) =>
    <String, dynamic>{
      'date_time': instance.date_time?.toIso8601String(),
      'daily_proof': instance.daily_proof,
    };
