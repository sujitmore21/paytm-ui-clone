import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';
import 'package:paytm_ui_clone/data/models/transaction_model.dart';

class TransactionNotifications extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionNotifications({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: AppTheme.cardDecoration,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Received ₹${transactions.isNotEmpty ? transactions.first.amount.toStringAsFixed(0) : '0'} - ${transactions.isNotEmpty ? transactions.first.senderName : 'Unknown'}",
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
          ),
          const SizedBox(width: 12),
          Container(
            decoration: AppTheme.cardDecoration,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.monetization_on,
                  color: AppTheme.accentYellow,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Gold Coins: Check",
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
    );
  }
}
