import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  final String id;
  final String senderName;
  final double amount;
  final DateTime timestamp;
  final String type;

  const TransactionModel({
    required this.id,
    required this.senderName,
    required this.amount,
    required this.timestamp,
    required this.type,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionModel copyWith({
    String? id,
    String? senderName,
    double? amount,
    DateTime? timestamp,
    String? type,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      senderName: senderName ?? this.senderName,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
    );
  }
}
