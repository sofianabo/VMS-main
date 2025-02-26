import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = Get.theme.canvasColor;

    path = Path();
    path.lineTo(-0.02, 0);
    path.cubicTo(-0.02, 0, size.width * 0.07, size.height * 0.03,
        size.width * 0.16, size.height * 0.05);
    path.cubicTo(size.width * 0.26, size.height * 0.07, size.width * 0.38,
        size.height * 0.08, size.width / 2, size.height * 0.08);
    path.cubicTo(size.width * 0.74, size.height * 0.08, size.width * 0.98,
        size.height * 0.11, size.width * 0.98, size.height * 0.15);
    path.cubicTo(size.width * 0.98, size.height * 0.15, size.width * 0.98,
        size.height * 0.84, size.width * 0.98, size.height * 0.84);
    path.cubicTo(size.width * 0.98, size.height * 0.86, size.width * 0.87,
        size.height * 0.88, size.width * 0.73, size.height * 0.89);
    path.cubicTo(size.width * 0.55, size.height * 0.9, size.width * 0.31,
        size.height * 0.92, size.width * 0.16, size.height * 0.95);
    path.cubicTo(size.width * 0.07, size.height * 0.96, -0.02, size.height,
        -0.02, size.height);
    path.cubicTo(-0.02, size.height, -0.02, 0, -0.02, 0);
    path.cubicTo(-0.02, 0, -0.02, 0, -0.02, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
