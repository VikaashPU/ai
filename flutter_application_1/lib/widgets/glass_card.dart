import 'package:flutter/material.dart';

/// ===============================
/// 🔐 LOGIN GLASS (SHINY / PREMIUM)
/// ===============================
class LoginGlassCard extends StatelessWidget {
  final Widget child;
  const LoginGlassCard({super.key, required this.child});
 
  @override
Widget build(BuildContext context) {
  return Stack(
    children: [
      // 1️⃣ Border + glass card (UNCHANGED logic)
      CustomPaint(
        painter: _LoginShinyBorderPainter(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.black.withOpacity(0.38),
              border: Border.all(
                color: const Color.fromARGB(255, 8, 174, 216)
                    .withOpacity(0.95),
                width: 2.2,
              ),
            ),
            child: child,
          ),
        ),
      ),

      // 2️⃣ 🔥 EDGE LIGHT STREAKS (ADD ONLY THIS)
      Positioned.fill(
        child: IgnorePointer(
          child: CustomPaint(
            painter: EdgeSpecularStreakPainter(),
          ),
        ),
      ),
    ],
  );
}
}

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
      ..strokeWidth = 2.2
      ..color = const Color.fromARGB(255, 8, 174, 216).withOpacity(0.95);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


/// ===============================
/// 📊 DASHBOARD GLASS (IMAGE MATCHED)
/// ===============================
class DashboardGlassCard extends StatelessWidget {
  final Widget child;
  const DashboardGlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
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
class EdgeSpecularStreakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // ===== LEFT EDGE STREAK =====
    _drawVerticalStreak(
      canvas,
      rect,
      x: 0.8,
      heightFactor: 0.65,
    );

    // ===== RIGHT EDGE STREAK =====
    _drawVerticalStreak(
      canvas,
      rect,
      x: size.width - 2.2,
      heightFactor: 0.55,
    );

    // ===== TOP EDGE STREAK =====
    _drawHorizontalStreak(
      canvas,
      rect,
      y: 0.8,
      widthFactor: 0.45,
    );
  }

  // -----------------------------

  void _drawVerticalStreak(
    Canvas canvas,
    Rect rect, {
    required double x,
    required double heightFactor,
  }) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          const Color(0xFF7FF6FF).withOpacity(0.6),
          Colors.white.withOpacity(1.0), // hotspot
          const Color(0xFF7FF6FF).withOpacity(0.6),
          Colors.transparent,
        ],
        stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
      ).createShader(rect);

    final height = rect.height * heightFactor;
    final top = (rect.height - height) / 2;

    canvas.drawRect(
      Rect.fromLTWH(x, top, 2.0, height),
      paint,
    );
  }

  void _drawHorizontalStreak(
    Canvas canvas,
    Rect rect, {
    required double y,
    required double widthFactor,
  }) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.transparent,
          const Color(0xFF7FF6FF).withOpacity(0.6),
          Colors.white.withOpacity(1.0), // hotspot
          const Color(0xFF7FF6FF).withOpacity(0.6),
          Colors.transparent,
        ],
        stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
      ).createShader(rect);

    final width = rect.width * widthFactor;
    final left = (rect.width - width) / 2;

    canvas.drawRect(
      Rect.fromLTWH(left, y, width, 2.0),
      paint,
    );
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
