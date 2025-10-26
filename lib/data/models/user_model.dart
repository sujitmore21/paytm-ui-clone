import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String? profileImage;
  final String upiId;
  final String bankName;
  final String accountLastFour;
  final bool isVerified;
  final double balance;
  final int goldCoins;

  const UserModel({
    required this.name,
    required this.profileImage,
    required this.upiId,
    required this.bankName,
    required this.accountLastFour,
    required this.isVerified,
    required this.balance,
    required this.goldCoins,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? name,
    String? profileImage,
    String? upiId,
    String? bankName,
    String? accountLastFour,
    bool? isVerified,
    double? balance,
    int? goldCoins,
  }) {
    return UserModel(
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      upiId: upiId ?? this.upiId,
      bankName: bankName ?? this.bankName,
      accountLastFour: accountLastFour ?? this.accountLastFour,
      isVerified: isVerified ?? this.isVerified,
      balance: balance ?? this.balance,
      goldCoins: goldCoins ?? this.goldCoins,
    );
  }
}
