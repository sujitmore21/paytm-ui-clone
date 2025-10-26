import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';
import 'package:paytm_ui_clone/data/models/user_model.dart';
import 'package:paytm_ui_clone/utils/asset_helper.dart';
import 'package:paytm_ui_clone/screens/profile_screen.dart';

class HeaderSection extends StatelessWidget {
  final UserModel? user;

  const HeaderSection({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Profile Picture
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: user),
                ),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: user?.profileImage != null
                    ? Image.network(
                        user?.profileImage ?? '',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.person,
                          color: AppTheme.paytmBlue,
                          size: 24,
                        ),
                      )
                    : Icon(Icons.person, color: AppTheme.paytmBlue, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Paytm Logo
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(assetsHelper.paytmLogo48, height: 60),
                const SizedBox(width: 4),
                Icon(Icons.favorite, color: AppTheme.heartRed, size: 24),
                const SizedBox(width: 4),
                Text(
                  "UPI",
                  style: GoogleFonts.inter(
                    color: AppTheme.paytmBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(assetsHelper.bhimIcon, height: 24),
                ),
              ],
            ),
          ),
          // Action Icons
          Row(
            children: [
              Icon(Icons.search, color: AppTheme.paytmBlue, size: 24),
              const SizedBox(width: 16),
              Icon(
                Icons.notifications_outlined,
                color: AppTheme.paytmBlue,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
