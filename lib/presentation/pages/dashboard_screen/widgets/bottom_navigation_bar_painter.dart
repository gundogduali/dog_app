import 'package:flutter/material.dart';

class BottomNavigationBarPainter extends CustomPainter {
  BottomNavigationBarPainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width, size.height * 1.010000)
      ..lineTo(size.width * 1.003139, size.height * 1.010000)
      ..lineTo(size.width * 1.002632, size.height * 0.9983890)
      ..lineTo(size.width * 0.9658080, size.height * 0.1526080)
      ..cubicTo(
        size.width * 0.9622293,
        size.height * 0.07038070,
        size.width * 0.9432853,
        size.height * 0.01000000,
        size.width * 0.9210667,
        size.height * 0.01000000,
      )
      ..lineTo(size.width * 0.07893227, size.height * 0.01000000)
      ..cubicTo(
        size.width * 0.05671467,
        size.height * 0.01000000,
        size.width * 0.03777120,
        size.height * 0.07038060,
        size.width * 0.03419120,
        size.height * 0.1526070,
      )
      ..lineTo(size.width * -0.002631821, size.height * 0.9983890)
      ..lineTo(size.width * -0.003137360, size.height * 1.010000)
      ..lineTo(0, size.height * 1.010000)
      ..lineTo(size.width, size.height * 1.010000)
      ..close();

    final paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.005333333
      ..color = const Color(0xffE5E5EA).withOpacity(1);
    canvas.drawPath(path_0, paint0Stroke);

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffF2F2F7).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
