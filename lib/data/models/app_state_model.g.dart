// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppStateModel _$AppStateModelFromJson(Map<String, dynamic> json) =>
    AppStateModel(
      currentTime: json['currentTime'] as String,
      batteryLevel: (json['batteryLevel'] as num).toInt(),
      festiveMessage: json['festiveMessage'] as String,
      isLoading: json['isLoading'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$AppStateModelToJson(AppStateModel instance) =>
    <String, dynamic>{
      'currentTime': instance.currentTime,
      'batteryLevel': instance.batteryLevel,
      'festiveMessage': instance.festiveMessage,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
    };
