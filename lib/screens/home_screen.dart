import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';
import 'package:paytm_ui_clone/data/viewmodels/app_viewmodels.dart';
import 'package:paytm_ui_clone/widgets/status_bar.dart';
import 'package:paytm_ui_clone/widgets/header_section.dart';
import 'package:paytm_ui_clone/widgets/upi_money_transfer_card.dart';
import 'package:paytm_ui_clone/widgets/recharge_bills_card.dart';
import 'package:paytm_ui_clone/widgets/financial_services_section.dart';
import 'package:paytm_ui_clone/widgets/transaction_notifications.dart';
import 'package:paytm_ui_clone/widgets/loan_banner.dart';
import 'package:paytm_ui_clone/widgets/travel_tickets_section.dart';
import 'package:paytm_ui_clone/screens/qr_code_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _scrollAnimationController;
  late Animation<double> _fadeAnimation;
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scrollAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start real-time updates for app state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(appStateViewModelProvider.notifier).startRealTimeUpdates();
      _scrollAnimationController.forward();
    });

    // Listen to scroll changes
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 100 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProminentScanButton(BuildContext context, user) {
    if (_isScrolled) {
      // Small icon-only button when scrolled
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF1E3A8A),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E3A8A).withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeScreen(user: user),
                  ),
                );
              }
            },
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      );
    } else {
      // Full button when not scrolled
      return Container(
        width: 220,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E3A8A),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E3A8A).withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeScreen(user: user),
                  ),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  "Scan QR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    final transactionState = ref.watch(transactionViewModelProvider);

    return Scaffold(
      body: Container(
        decoration: AppTheme.gradientBackground,
        child: SafeArea(
          child: Column(
            children: [
              const StatusBar(),
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        userState.when(
                          data: (user) => HeaderSection(user: user),
                          loading: () => const HeaderSection(user: null),
                          error: (_, __) => const HeaderSection(user: null),
                        ),
                        const SizedBox(height: 16),
                        const UpiMoneyTransferCard(),
                        const SizedBox(height: 16),
                        const RechargeBillsCard(),
                        const SizedBox(height: 16),
                        userState.when(
                          data: (user) => FinancialServicesSection(user: user),
                          loading: () =>
                              const FinancialServicesSection(user: null),
                          error: (_, __) =>
                              const FinancialServicesSection(user: null),
                        ),
                        const SizedBox(height: 16),
                        transactionState.when(
                          data: (transactions) => TransactionNotifications(
                            transactions: transactions,
                          ),
                          loading: () =>
                              const TransactionNotifications(transactions: []),
                          error: (_, __) =>
                              const TransactionNotifications(transactions: []),
                        ),
                        const SizedBox(height: 16),
                        const LoanBanner(),
                        const SizedBox(height: 16),
                        const TravelTicketsSection(),
                        const SizedBox(
                          height: 100,
                        ), // Space for the floating button
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: userState.when(
          data: (user) => _buildProminentScanButton(context, user),
          loading: () => _buildProminentScanButton(context, null),
          error: (_, __) => _buildProminentScanButton(context, null),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
