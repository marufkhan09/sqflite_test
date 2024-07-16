import 'package:flutter/material.dart';
import 'dart:math';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double width = size.width;
    final double height = size.height;
    final double radius = width / 2;
    final double angle = (2 * pi) / 6;

    Offset getPoint(double angle, double radius, Offset center) {
      return Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }

    final center = Offset(width / 2, height / 2);

    final points = List.generate(6, (index) {
      final pointAngle =
          angle * index - pi / 2; // Rotate to have one side at the top
      return getPoint(pointAngle, radius, center);
    });

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
