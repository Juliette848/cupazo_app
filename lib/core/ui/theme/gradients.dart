import 'package:flutter/material.dart';
import 'colors.dart';

/// Sistema de Gradientes de Marca
/// Basado en el branding de Cupazo: Amarillo principal y negro
class AppGradients {
  AppGradients._();

  // ══════════════════════════════════════════════════════════════════════════
  // GRADIENTES PRINCIPALES - Para fondos y superficies hero
  // ══════════════════════════════════════════════════════════════════════════

  /// Gradiente primario vibrante: Amarillo principal → Amarillo secundario
  /// Uso: Splash, welcome hero, CTAs principales
  static const LinearGradient flameHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryYellow, AppColors.secondaryYellow],
  );

  /// Gradiente energético: Negro profundo → Amarillo principal → Amarillo secundario
  /// Uso: Backgrounds completos, promo banners
  static const LinearGradient energyFlow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.deepBlack,
      AppColors.primaryYellow,
      AppColors.secondaryYellow,
    ],
    stops: [0.0, 0.5, 1.0],
  );

  /// Gradiente suave difuminado para fondos (más sutil)
  /// Uso: Login, signup, forgot password backgrounds
  static const LinearGradient softAmbient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.surface, AppColors.surfaceMuted, AppColors.surfaceHint],
  );
}
