import 'package:flutter/material.dart';

class BluePainter extends CustomPainter {
  final Path quadPath = new Path()
    ..moveTo(123.0, 12.2)
    ..relativeLineTo(1.1, -0.2)
    ..relativeCubicTo(4.2, -0.6, 12.1, 1.3, 3.2, 3.1)
  // etc all the way around
    ..close();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeWidth = 0.0;

    canvas.drawPath(quadPath, paint);

    paint.color = Colors.blue[600];
    canvas.drawCircle(new Offset(123.4, 56.7), 12.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}