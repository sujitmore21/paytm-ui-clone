// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
  title: json['title'] as String,
  icon: json['icon'] as String,
  subtitle: json['subtitle'] as String?,
  hasNoFee: json['hasNoFee'] as bool? ?? false,
);

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
      'subtitle': instance.subtitle,
      'hasNoFee': instance.hasNoFee,
    };
