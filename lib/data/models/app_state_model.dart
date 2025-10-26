import 'package:json_annotation/json_annotation.dart';

part 'app_state_model.g.dart';

@JsonSerializable()
class AppStateModel {
  final String currentTime;
  final int batteryLevel;
  final String festiveMessage;
  final bool isLoading;
  final String? errorMessage;

  const AppStateModel({
    required this.currentTime,
    required this.batteryLevel,
    required this.festiveMessage,
    this.isLoading = false,
    this.errorMessage,
  });

  factory AppStateModel.fromJson(Map<String, dynamic> json) =>
      _$AppStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateModelToJson(this);

  AppStateModel copyWith({
    String? currentTime,
    int? batteryLevel,
    String? festiveMessage,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AppStateModel(
      currentTime: currentTime ?? this.currentTime,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      festiveMessage: festiveMessage ?? this.festiveMessage,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
