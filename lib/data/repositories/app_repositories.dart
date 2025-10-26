import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytm_ui_clone/data/models/user_model.dart';
import 'package:paytm_ui_clone/data/models/transaction_model.dart';
import 'package:paytm_ui_clone/data/models/service_model.dart';
import 'package:paytm_ui_clone/data/models/app_state_model.dart';

// Repository interface
abstract class UserRepository {
  Future<UserModel> getCurrentUser();
  Future<void> updateUser(UserModel user);
}

abstract class TransactionRepository {
  Future<List<TransactionModel>> getRecentTransactions();
  Future<void> addTransaction(TransactionModel transaction);
}

abstract class ServiceRepository {
  Future<List<ServiceModel>> getRechargeServices();
  Future<List<ServiceModel>> getQuickActions();
}

abstract class AppStateRepository {
  Future<AppStateModel> getAppState();
  Stream<AppStateModel> watchAppState();
}

// Implementation
class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel> getCurrentUser() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    return const UserModel(
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

  @override
  Future<void> updateUser(UserModel user) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 300));
  }
}

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<List<TransactionModel>> getRecentTransactions() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      TransactionModel(
        id: "1",
        senderName: "Deepak M",
        amount: 95900.0,
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        type: "received",
      ),
      TransactionModel(
        id: "2",
        senderName: "Rajesh K",
        amount: 2500.0,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: "received",
      ),
      TransactionModel(
        id: "3",
        senderName: "Amazon",
        amount: 1200.0,
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        type: "sent",
      ),
    ];
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

class ServiceRepositoryImpl implements ServiceRepository {
  @override
  Future<List<ServiceModel>> getRechargeServices() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return [
      const ServiceModel(
        title: "Mobile Recharge",
        icon: "phone",
        subtitle: "Prepaid & Postpaid",
      ),
      const ServiceModel(
        title: "FASTag Recharge",
        icon: "car",
        subtitle: "Toll Payments",
      ),
      const ServiceModel(
        title: "Electricity Bill",
        icon: "lightbulb",
        subtitle: "Power Bills",
      ),
      const ServiceModel(
        title: "Loan EMI Payment",
        icon: "calendar",
        subtitle: "EMI Payments",
      ),
      const ServiceModel(
        title: "Credit Card Bill",
        icon: "credit_card",
        subtitle: "Card Payments",
      ),
      const ServiceModel(
        title: "Insurance / LIC",
        icon: "shield",
        subtitle: "Insurance Premium",
      ),
      const ServiceModel(
        title: "Mobile Postpaid",
        icon: "phone_android",
        subtitle: "Postpaid Bills",
        hasNoFee: true,
      ),
      const ServiceModel(
        title: "Broadband Landline",
        icon: "wifi",
        subtitle: "Internet Bills",
      ),
      const ServiceModel(
        title: "Piped Gas Bill",
        icon: "local_fire_department",
        subtitle: "Gas Bills",
      ),
      const ServiceModel(
        title: "Book Gas Cylinder",
        icon: "local_gas_station",
        subtitle: "Gas Booking",
      ),
      const ServiceModel(
        title: "DTH Recharge",
        icon: "satellite_alt",
        subtitle: "TV Recharge",
      ),
      const ServiceModel(
        title: "Google Play Recharge",
        icon: "play_circle_fill",
        subtitle: "Play Store",
      ),
    ];
  }

  @override
  Future<List<ServiceModel>> getQuickActions() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return [
      const ServiceModel(title: "Metro Tickets", icon: "subway"),
      const ServiceModel(title: "PNR Train Status", icon: "train"),
    ];
  }
}

class AppStateRepositoryImpl implements AppStateRepository {
  @override
  Future<AppStateModel> getAppState() async {
    await Future.delayed(const Duration(milliseconds: 100));

    final now = DateTime.now();
    return AppStateModel(
      currentTime:
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}",
      batteryLevel: 35,
      festiveMessage: "Happy Chhath Puja",
    );
  }

  @override
  Stream<AppStateModel> watchAppState() async* {
    while (true) {
      yield await getAppState();
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}

// Providers
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepositoryImpl();
});

final serviceRepositoryProvider = Provider<ServiceRepository>((ref) {
  return ServiceRepositoryImpl();
});

final appStateRepositoryProvider = Provider<AppStateRepository>((ref) {
  return AppStateRepositoryImpl();
});
