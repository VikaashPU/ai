import 'dart:math';
import 'package:flutter/material.dart';

class PaymentDonutChart extends StatelessWidget {
  final double paid;
  final double pending;

  const PaymentDonutChart({
    super.key,
    required this.paid,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    final total = paid + pending;
    final paidAngle = (paid / total) * 2 * pi;

    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(160, 160),
            painter: _DonutPainter(paidAngle),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                '₹80L',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Pending',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  final double paidAngle;
  _DonutPainter(this.paidAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    final bgPaint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;

    final paidPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF66F2FF), Color(0xFF2BB3FF)],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;

    canvas.drawCircle(center, radius - 8, bgPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 8),
      -pi / 2,
      paidAngle,
      false,
      paidPaint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
