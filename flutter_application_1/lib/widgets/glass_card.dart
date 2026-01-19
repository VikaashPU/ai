import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 34,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),

          // 🔹 Softer, lighter border
          border: Border.all(
            color: Colors.cyanAccent.withOpacity(0.35),
            width: 1.1,
          ),

          // 🔹 Much softer glow
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.18),
              blurRadius: 50,
              spreadRadius: 1,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
