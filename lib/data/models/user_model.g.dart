// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  name: json['name'] as String,
  profileImage: json['profileImage'] as String,
  upiId: json['upiId'] as String,
  bankName: json['bankName'] as String,
  accountLastFour: json['accountLastFour'] as String,
  isVerified: json['isVerified'] as bool,
  balance: (json['balance'] as num).toDouble(),
  goldCoins: (json['goldCoins'] as num).toInt(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'name': instance.name,
  'profileImage': instance.profileImage,
  'upiId': instance.upiId,
  'bankName': instance.bankName,
  'accountLastFour': instance.accountLastFour,
  'isVerified': instance.isVerified,
  'balance': instance.balance,
  'goldCoins': instance.goldCoins,
};
