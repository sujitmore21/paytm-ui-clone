import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytm_ui_clone/data/viewmodels/app_viewmodels.dart';

class StatusBar extends ConsumerWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appState?.currentTime ?? "00:00",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 18),
              const SizedBox(width: 4),
              Icon(Icons.wifi, color: Colors.white, size: 18),
              const SizedBox(width: 4),
              Icon(Icons.battery_3_bar, color: Colors.white, size: 18),
              const SizedBox(width: 4),
              Text(
                "${appState?.batteryLevel ?? 0}%",
                style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
