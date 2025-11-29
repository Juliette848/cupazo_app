import 'package:flutter/material.dart';

/// Painter para crear formas ondeadas
class WavePainter extends CustomPainter {
  final Color color;
  final double waveHeight;
  final double waveFrequency;

  WavePainter({
    this.color = Colors.white,
    this.waveHeight = 30.0,
    this.waveFrequency = 0.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);

    // Crear onda más pronunciada y suave
    final numberOfWaves = 3.0;
    final waveLength = size.width / numberOfWaves;
    
    for (double i = 0; i < numberOfWaves; i++) {
      final x = i * waveLength;
      final nextX = (i + 1) * waveLength;
      final midX = x + waveLength / 2;
      
      if (i == 0) {
        path.quadraticBezierTo(
          midX,
          waveHeight * waveFrequency,
          nextX,
          0,
        );
      } else {
        path.quadraticBezierTo(
          midX,
          waveHeight * waveFrequency * (i % 2 == 0 ? 1 : -1),
          nextX,
          0,
        );
      }
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.waveHeight != waveHeight ||
      oldDelegate.waveFrequency != waveFrequency;
}

