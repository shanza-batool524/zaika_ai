import 'package:flutter/material.dart';

class NotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchRadius = 130;
    double cornerRadius = 10;
    double notchStartOffset = 15; // <-- New: flat space before notch starts
    double centerX = size.width / 2;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(centerX - notchRadius - cornerRadius - notchStartOffset, 0);

    path.quadraticBezierTo(
      centerX - notchRadius - notchStartOffset,
      0,
      centerX - notchRadius - notchStartOffset,
      cornerRadius,
    );

    path.arcToPoint(
      Offset(centerX + notchRadius + notchStartOffset, cornerRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    path.quadraticBezierTo(
      centerX + notchRadius + notchStartOffset,
      0,
      centerX + notchRadius + cornerRadius + notchStartOffset,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}