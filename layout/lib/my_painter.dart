import 'package:flutter/widgets.dart';

// Converted from assets/test.svg using https://www.flutterclutter.dev/tools/svg-to-flutter-path-converter/

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();


    // Path number 1


    paint.color = Color(0xffaa0000);
    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.82, size.height * 0.35, size.width * 0.43, size.height * 0.18);
    path.cubicTo(size.width * 0.05, size.height * 0.02, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, 0, 0, 0);
    canvas.drawPath(path, paint);


    // Path number 2


    paint.color = Color(0xffaa4400);
    path = Path();
    path.lineTo(size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, size.width * 0.1, size.height * 0.7, size.width * 0.48, size.height * 0.87);
    path.cubicTo(size.width * 0.67, size.height * 0.95, size.width * 0.9, size.height, size.width * 0.94, size.height * 0.51);
    path.cubicTo(size.width * 0.96, size.height * 0.08, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height, size.width, size.height);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


