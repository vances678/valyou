import 'dart:math';
import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

double currentValue = 80;
double maxValue = 100;

class ArcChart extends CustomPainter {
  final Color startColor;
  final Color endColor;

  ArcChart({required this.startColor, required this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect boundingRect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width / 2,
    );

    final Paint backgroundPaint = Paint()
      ..color = Defaults.colors.detailLight
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    final Paint dataPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          startColor,
          endColor,
        ],
      ).createShader(boundingRect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    const startAngle = pi;
    const sweepAngle = pi;

    canvas.drawArc(
      boundingRect,
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    final dataAngle = sweepAngle * (currentValue / maxValue);

    canvas.drawArc(
      boundingRect,
      startAngle,
      dataAngle,
      false,
      dataPaint,
    );
  }

  @override
  bool shouldRepaint(ArcChart oldDelegate) =>
      oldDelegate.startColor != startColor || oldDelegate.endColor != endColor;
}
