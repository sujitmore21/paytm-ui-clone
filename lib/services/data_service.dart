import 'package:paytm_ui_clone/models/user_data.dart';

class DataService {
  static UserData getCurrentUser() {
    return UserData(
      name: "John Doe",
      profileImage: "assetss/images/profile.jpg",
      upiId: "8888888888@ptyes",
      bankName: "HDFC Bank",
      accountLastFour: "8888",
      isVerified: true,
      balance: 125000.0,
      goldCoins: 1250,
    );
  }

  static List<TransactionData> getRecentTransactions() {
    return [
      TransactionData(
        id: "1",
        senderName: "Man Doe",
        amount: 95900.0,
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        type: "received",
      ),
      TransactionData(
        id: "2",
        senderName: "Rajesh K",
        amount: 2500.0,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: "received",
      ),
      TransactionData(
        id: "3",
        senderName: "Amazon",
        amount: 1200.0,
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        type: "sent",
      ),
    ];
  }

  static List<ServiceItem> getRechargeServices() {
    return [
      ServiceItem(
        title: "Mobile Recharge",
        icon: "phone",
        subtitle: "Prepaid & Postpaid",
      ),
      ServiceItem(
        title: "FASTag Recharge",
        icon: "car",
        subtitle: "Toll Payments",
      ),
      ServiceItem(
        title: "Electricity Bill",
        icon: "lightbulb",
        subtitle: "Power Bills",
      ),
      ServiceItem(
        title: "Loan EMI Payment",
        icon: "calendar",
        subtitle: "EMI Payments",
      ),
      ServiceItem(
        title: "Credit Card Bill",
        icon: "credit_card",
        subtitle: "Card Payments",
      ),
      ServiceItem(
        title: "Insurance / LIC",
        icon: "shield",
        subtitle: "Insurance Premium",
      ),
      ServiceItem(
        title: "Mobile Postpaid",
        icon: "phone_android",
        subtitle: "Postpaid Bills",
        hasNoFee: true,
      ),
      ServiceItem(
        title: "Broadband Landline",
        icon: "wifi",
        subtitle: "Internet Bills",
      ),
      ServiceItem(
        title: "Piped Gas Bill",
        icon: "local_fire_department",
        subtitle: "Gas Bills",
      ),
      ServiceItem(
        title: "Book Gas Cylinder",
        icon: "local_gas_station",
        subtitle: "Gas Booking",
      ),
      ServiceItem(
        title: "DTH Recharge",
        icon: "satellite_alt",
        subtitle: "TV Recharge",
      ),
      ServiceItem(
        title: "Google Play Recharge",
        icon: "play_circle_fill",
        subtitle: "Play Store",
      ),
    ];
  }

  static List<QuickAction> getQuickActions() {
    return [
      QuickAction(title: "Metro Tickets", icon: "subway", route: "/metro"),
      QuickAction(title: "PNR Train Status", icon: "train", route: "/pnr"),
    ];
  }

  static String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  }

  static int getBatteryLevel() {
    return 35; // Simulated battery level
  }

  static String getFestiveMessage() {
    return "Happy Chhath Puja";
  }

  static Map<String, dynamic> getLoanOffer() {
    return {
      "amount": "₹15 Lakh",
      "interestRate": "2% lower interest",
      "cashback": "₹25-₹100 Cashback",
      "isExclusive": true,
    };
  }
}
