import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/screens/qr_code_screen.dart';
import 'package:paytm_ui_clone/data/models/user_model.dart';

class FloatingScanButton extends StatelessWidget {
  final UserModel? user;

  const FloatingScanButton({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A), // Dark blue background
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E3A8A).withValues(alpha: 0.3),
            blurRadius: 12,
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
                  builder: (context) => QRCodeScreen(user: user!),
                ),
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Text(
                "Scan QR",
                style: GoogleFonts.inter(
                  fontSize: 16,
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
