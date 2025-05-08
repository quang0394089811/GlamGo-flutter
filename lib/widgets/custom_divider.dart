import 'dart:math';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double dotRadius;
  final double dotSpacing;
  final double waveAmplitude;
  final double waveFrequency;
  final double zigzagHeight;
  final double zigzagWidth;
  final DividerType type;

  const CustomDivider({
    super.key,
    this.height = 1,
    this.color = Colors.grey,
    this.dashWidth = 5,
    this.dashSpace = 5,
    this.dotRadius = 2,
    this.dotSpacing = 5,
    this.waveAmplitude = 5,
    this.waveFrequency = 0.1,
    this.zigzagHeight = 5,
    this.zigzagWidth = 10,
    this.type = DividerType.dashed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        return SizedBox(
          height: height,
          width: boxWidth,
          child: CustomPaint(
            painter: _buildPainter(boxWidth),
          ),
        );
      },
    );
  }

  CustomPainter _buildPainter(double boxWidth) {
    switch (type) {
      case DividerType.dashed:
        return DashedLinePainter(
          color: color,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          dashCount: (boxWidth / (dashWidth + dashSpace)).floor(),
        );
      case DividerType.dotted:
        return DottedLinePainter(
          color: color,
          dotRadius: dotRadius,
          dotSpacing: dotSpacing,
          dotCount: (boxWidth / (dotRadius * 2 + dotSpacing)).floor(),
        );
      case DividerType.wave:
        return WaveLinePainter(
          color: color,
          amplitude: waveAmplitude,
          frequency: waveFrequency,
        );
      case DividerType.zigzag:
        return ZigzagLinePainter(
          color: color,
          height: zigzagHeight,
          width: zigzagWidth,
        );
    }
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final int dashCount;

  DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.dashCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (int i = 0; i < dashCount; i++) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double dotRadius;
  final double dotSpacing;
  final int dotCount;

  DottedLinePainter({
    required this.color,
    required this.dotRadius,
    required this.dotSpacing,
    required this.dotCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = dotRadius;
    final paint = Paint()..color = color;
    for (int i = 0; i < dotCount; i++) {
      canvas.drawCircle(Offset(startX, 0), dotRadius, paint);
      startX += dotRadius * 2 + dotSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class WaveLinePainter extends CustomPainter {
  final Color color;
  final double amplitude;
  final double frequency;

  WaveLinePainter({
    required this.color,
    required this.amplitude,
    required this.frequency,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    for (double x = 0; x < size.width; x++) {
      final y = size.height / 2 + amplitude * sin(x * frequency);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ZigzagLinePainter extends CustomPainter {
  final Color color;
  final double height;
  final double width;

  ZigzagLinePainter({
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    double x = 0;
    bool up = true;
    while (x < size.width) {
      if (up) {
        path.lineTo(x, size.height / 2 - height);
      } else {
        path.lineTo(x, size.height / 2 + height);
      }
      x += width;
      up = !up;
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

enum DividerType { dashed, dotted, wave, zigzag }
