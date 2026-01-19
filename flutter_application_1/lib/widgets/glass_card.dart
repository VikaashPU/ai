import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ShinyBorderPainter(), // ✅ now Dart knows it
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 34,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.black.withOpacity(0.35),
            border: Border.all(
              color: Colors.cyanAccent.withOpacity(0.35),
              width: 1.1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// 👇 ADD THIS BELOW GlassCard
class _ShinyBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rrect = RRect.fromRectAndRadius(
      rect.deflate(0.6),
      const Radius.circular(28),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.65),
          Colors.cyanAccent.withOpacity(0.25),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
