class UserData {
  final String name;
  final String profileImage;
  final String upiId;
  final String bankName;
  final String accountLastFour;
  final bool isVerified;
  final double balance;
  final int goldCoins;

  UserData({
    required this.name,
    required this.profileImage,
    required this.upiId,
    required this.bankName,
    required this.accountLastFour,
    required this.isVerified,
    required this.balance,
    required this.goldCoins,
  });
}

class TransactionData {
  final String id;
  final String senderName;
  final double amount;
  final DateTime timestamp;
  final String type;

  TransactionData({
    required this.id,
    required this.senderName,
    required this.amount,
    required this.timestamp,
    required this.type,
  });
}

class ServiceItem {
  final String title;
  final String icon;
  final String? subtitle;
  final bool hasNoFee;

  ServiceItem({
    required this.title,
    required this.icon,
    this.subtitle,
    this.hasNoFee = false,
  });
}

class QuickAction {
  final String title;
  final String icon;
  final String route;

  QuickAction({required this.title, required this.icon, required this.route});
}
