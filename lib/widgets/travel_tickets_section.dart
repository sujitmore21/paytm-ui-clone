import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/theme/app_theme.dart';

class TravelTicketsSection extends StatelessWidget {
  const TravelTicketsSection({super.key});

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
            "Travel & Tickets",
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
              _buildTravelItem(
                icon: Icons.flight,
                title: "Flight",
                onTap: () {},
              ),
              _buildTravelItem(icon: Icons.train, title: "Train", onTap: () {}),
              _buildTravelItem(
                icon: Icons.directions_bus,
                title: "Bus",
                onTap: () {},
              ),
              _buildTravelItem(
                icon: Icons.hotel,
                title: "Hotels",
                onTap: () {},
              ),
              _buildTravelItem(
                icon: Icons.subway,
                title: "Metro\nTickets",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTravelItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
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
