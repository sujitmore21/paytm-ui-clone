import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';

class RechargeBillsPopup extends StatelessWidget {
  const RechargeBillsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recharges and Bills",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.paytmBlue,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Services Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
              children: [
                _buildServiceItem(
                  icon: Icons.credit_card,
                  title: "Credit Card Bill",
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.account_balance,
                  title: "Insurance / LIC",
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.phone_android,
                  title: "Mobile Postpaid",
                  hasNoFee: true,
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.wifi,
                  title: "Broadband Landline",
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.local_fire_department,
                  title: "Piped Gas Bill",
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.local_gas_station,
                  title: "Book Gas Cylinder",
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.satellite_alt,
                  title: "DTH Recharge",
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.play_circle_fill,
                  title: "Google Play Recharge",
                  onTap: () {},
                ),
                _buildServiceItem(
                  icon: Icons.arrow_forward,
                  title: "View All",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    bool hasNoFee = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
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
              if (hasNoFee)
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.accentYellow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "No Fee",
                      style: GoogleFonts.inter(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.paytmBlue,
                      ),
                    ),
                  ),
                ),
            ],
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
