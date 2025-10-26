import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';
import 'package:paytm_ui_clone/utils/asset_helper.dart';

class UpiMoneyTransferCard extends StatelessWidget {
  const UpiMoneyTransferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UPI Money Transfer",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.paytmBlue,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionItemWithIcon(
                icon: Icons.qr_code_scanner,
                title: "Scan \nPay",
                onTap: () {},
              ),
              _buildActionItemWithassets(
                assetsPath: assetsHelper.bhimIcon,
                title: "BHIM \nUPI",
                onTap: () {},
              ),
              _buildActionItemWithIcon(
                icon: Icons.account_balance,
                title: "To Bank\n/ Self",
                onTap: () {},
              ),
              _buildActionItemWithIcon(
                icon: Icons.history,
                title: "Balance &\nHistory",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionItemWithIcon({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.paytmBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.paytmBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItemWithassets({
    required String assetsPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.paytmBlue,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(assetsPath, width: 36, height: 36),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.paytmBlue,
            ),
          ),
        ],
      ),
    );
  }
}
