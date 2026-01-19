import 'package:flutter/material.dart';

/// ===============================
/// 🔐 LOGIN GLASS (SHINY / PREMIUM)
/// ===============================
class LoginGlassCard extends StatelessWidget {
  final Widget child;
  const LoginGlassCard({super.key, required this.child});
 
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LoginShinyBorderPainter(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 34),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.black.withOpacity(0.38),
            border: Border.all(
              color: const Color.fromARGB(255, 8, 174, 216).withOpacity(0.95),
              width: 2.2, // ✨ slightly thicker
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// ===============================
/// 📊 DASHBOARD GLASS (IMAGE MATCHED)
/// ===============================
class DashboardGlassCard extends StatelessWidget {
  final Widget child;
  const DashboardGlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.black.withOpacity(0.22),
          border: Border.all(color: Colors.white.withOpacity(0.08), width: 0.9),
    return CustomPaint(
      painter: _DashboardBorderPainter(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),

            // 🌌 DARK GLASS SURFACE (matches image)
            color: const Color.fromARGB(255, 38, 46, 61).withOpacity(0.15),

            // 🌫 INNER HAIRLINE BORDER (depth)
            border: Border.all(
              color: Colors.white.withOpacity(0.06),
              width: 0.6,
            ),

            // ✨ SOFT OUTER GLOW
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3FA9F5).withOpacity(0.12),
                blurRadius: 18,
                spreadRadius: 0.4,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

/// ===============================
/// ✨ LOGIN SHINY BORDER PAINTER
/// ===============================
class _LoginShinyBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rrect = RRect.fromRectAndRadius(
      rect.deflate(0.6),
      const Radius.circular(28),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.75),
          Colors.cyanAccent.withOpacity(0.45),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// ===============================
/// 🎨 DASHBOARD BORDER PAINTER
/// ===============================
class _DashboardBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rrect = RRect.fromRectAndRadius(
      rect.deflate(0.8),
      const Radius.circular(22),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF7FC8FF).withOpacity(0.45),
          const Color(0xFF3FA9F5).withOpacity(0.25),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
