import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytm_ui_clone/data/models/user_model.dart';
import 'package:paytm_ui_clone/data/models/transaction_model.dart';
import 'package:paytm_ui_clone/data/models/service_model.dart';
import 'package:paytm_ui_clone/data/models/app_state_model.dart';
import 'package:paytm_ui_clone/data/repositories/app_repositories.dart';

// User ViewModel
class UserViewModel extends StateNotifier<AsyncValue<UserModel>> {
  final UserRepository _userRepository;

  UserViewModel(this._userRepository) : super(const AsyncValue.loading()) {
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      state = const AsyncValue.loading();
      final user = await _userRepository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _userRepository.updateUser(user);
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Transaction ViewModel
class TransactionViewModel
    extends StateNotifier<AsyncValue<List<TransactionModel>>> {
  final TransactionRepository _transactionRepository;

  TransactionViewModel(this._transactionRepository)
    : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final transactions = await _transactionRepository.getRecentTransactions();
      state = AsyncValue.data(transactions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      await _transactionRepository.addTransaction(transaction);
      await loadTransactions(); // Reload to get updated list
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Service ViewModel
class ServiceViewModel extends StateNotifier<AsyncValue<List<ServiceModel>>> {
  final ServiceRepository _serviceRepository;

  ServiceViewModel(this._serviceRepository)
    : super(const AsyncValue.loading()) {
    loadServices();
  }

  Future<void> loadServices() async {
    try {
      state = const AsyncValue.loading();
      final services = await _serviceRepository.getRechargeServices();
      state = AsyncValue.data(services);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// App State ViewModel
class AppStateViewModel extends StateNotifier<AsyncValue<AppStateModel>> {
  final AppStateRepository _appStateRepository;

  AppStateViewModel(this._appStateRepository)
    : super(const AsyncValue.loading()) {
    loadAppState();
  }

  Future<void> loadAppState() async {
    try {
      state = const AsyncValue.loading();
      final appState = await _appStateRepository.getAppState();
      state = AsyncValue.data(appState);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void startRealTimeUpdates() {
    _appStateRepository.watchAppState().listen(
      (appState) {
        if (mounted) {
          state = AsyncValue.data(appState);
        }
      },
      onError: (error, stackTrace) {
        if (mounted) {
          state = AsyncValue.error(error, stackTrace);
        }
      },
    );
  }
}

// Providers
final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModel>>((ref) {
      final userRepository = ref.watch(userRepositoryProvider);
      return UserViewModel(userRepository);
    });

final transactionViewModelProvider =
    StateNotifierProvider<
      TransactionViewModel,
      AsyncValue<List<TransactionModel>>
    >((ref) {
      final transactionRepository = ref.watch(transactionRepositoryProvider);
      return TransactionViewModel(transactionRepository);
    });

final serviceViewModelProvider =
    StateNotifierProvider<ServiceViewModel, AsyncValue<List<ServiceModel>>>((
      ref,
    ) {
      final serviceRepository = ref.watch(serviceRepositoryProvider);
      return ServiceViewModel(serviceRepository);
    });

final appStateViewModelProvider =
    StateNotifierProvider<AppStateViewModel, AsyncValue<AppStateModel>>((ref) {
      final appStateRepository = ref.watch(appStateRepositoryProvider);
      return AppStateViewModel(appStateRepository);
    });

// Convenience providers
final currentUserProvider = Provider<UserModel?>((ref) {
  final userState = ref.watch(userViewModelProvider);
  return userState.when(
    data: (user) => user,
    loading: () => null,
    error: (_, __) => null,
  );
});

final recentTransactionsProvider = Provider<List<TransactionModel>>((ref) {
  final transactionState = ref.watch(transactionViewModelProvider);
  return transactionState.when(
    data: (transactions) => transactions,
    loading: () => [],
    error: (_, __) => [],
  );
});

final rechargeServicesProvider = Provider<List<ServiceModel>>((ref) {
  final serviceState = ref.watch(serviceViewModelProvider);
  return serviceState.when(
    data: (services) => services,
    loading: () => [],
    error: (_, __) => [],
  );
});

final appStateProvider = Provider<AppStateModel?>((ref) {
  final appState = ref.watch(appStateViewModelProvider);
  return appState.when(
    data: (state) => state,
    loading: () => null,
    error: (_, __) => null,
  );
});
