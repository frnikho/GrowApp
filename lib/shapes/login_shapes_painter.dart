import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopLoginShapesPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.orange;
    paint.strokeWidth = 2.0;

    final path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.19, size.width * 0.1, size.height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return (true);
  }

}