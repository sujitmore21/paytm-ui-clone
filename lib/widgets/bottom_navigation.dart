import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';
import 'package:paytm_ui_clone/screens/settings_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            icon: Icons.home,
            label: "Home",
            isSelected: true,
            onTap: () {},
          ),
          _buildNavItem(
            icon: Icons.qr_code_scanner,
            label: "Scan",
            isSelected: false,
            onTap: () {},
          ),
          _buildNavItem(
            icon: Icons.account_balance_wallet,
            label: "Wallet",
            isSelected: false,
            onTap: () {},
          ),
          _buildNavItem(
            icon: Icons.person,
            label: "Profile",
            isSelected: false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.primaryBlue : AppTheme.textSecondary,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppTheme.primaryBlue : AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
