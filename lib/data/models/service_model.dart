import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  final String title;
  final String icon;
  final String? subtitle;
  final bool hasNoFee;

  const ServiceModel({
    required this.title,
    required this.icon,
    this.subtitle,
    this.hasNoFee = false,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);

  ServiceModel copyWith({
    String? title,
    String? icon,
    String? subtitle,
    bool? hasNoFee,
  }) {
    return ServiceModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      subtitle: subtitle ?? this.subtitle,
      hasNoFee: hasNoFee ?? this.hasNoFee,
    );
  }
}
