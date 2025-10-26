import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';
import 'package:paytm_ui_clone/data/models/user_model.dart';
import 'package:paytm_ui_clone/utils/asset_helper.dart';

class FinancialServicesSection extends StatelessWidget {
  final UserModel? user;

  const FinancialServicesSection({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: AppTheme.cardDecoration,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Paytm Money",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.paytmBlue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Invest in Stocks, Mutual Funds, ETFs & IPO",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: AppTheme.primaryBlue,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Image.asset(
                            AssetHelper.loveIcon,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                      if (user != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          "Balance: ₹${user!.balance.toStringAsFixed(0)}",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.successGreen,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: AppTheme.cardDecoration,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: AppTheme.accentYellow,
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Save in Gold",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.paytmBlue,
                            ),
                          ),
                          if (user != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              "${user!.goldCoins} coins",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      decoration: AppTheme.cardDecoration,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(
                            Icons.flash_on,
                            color: AppTheme.primaryBlue,
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "What's New",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.paytmBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
