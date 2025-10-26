import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';
import 'package:paytm_ui_clone/widgets/recharge_bills_popup.dart';

class RechargeBillsCard extends StatelessWidget {
  const RechargeBillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recharge & Bills",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.paytmBlue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const RechargeBillsPopup(),
                  );
                },
                child: Text(
                  "View More",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildServiceItem(
                icon: Icons.phone_android,
                title: "Mobile\nRecharge",
                onTap: () {},
              ),
              _buildServiceItem(
                icon: Icons.directions_car,
                title: "FASTag\nRecharge",
                onTap: () {},
              ),
              _buildServiceItem(
                icon: Icons.lightbulb,
                title: "Electricity\nBill",
                onTap: () {},
              ),
              _buildServiceItem(
                icon: Icons.calendar_month,
                title: "Loan EMI\nPayment",
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 30,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem({
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
              color: AppTheme.primaryBlue,
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
}
