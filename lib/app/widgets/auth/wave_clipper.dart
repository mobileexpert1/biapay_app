import 'package:flutter/material.dart';

/// Clip widget in wave shape shape
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Offset firstEndPoint = Offset(size.width * .5, size.height - 30);
    final Offset firstControlPoint = Offset(size.width * .20, size.height - 60);
    final Offset secondEndPoint = Offset(size.width, size.height);
    final Offset secondControlPoint = Offset(size.width * .75, size.height);

    final path = Path()
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy)
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
