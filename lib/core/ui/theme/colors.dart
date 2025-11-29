import 'package:flutter/material.dart';

/// Colores de la aplicación basados en el ícono de Cupazo
class AppColors {
  // Neutrals
  static const Color ink = Color(0xFF1A1A1A); // Negro mano/ticket
  static const Color inkMuted = Color(0xFF3A3A3A); // Negro suavizado
  static const Color inkSoft = Color(0xFF707070); // Texto secundario
  static const Color line = Color(0xFFE0E0E0); // Líneas divisorias
  static const Color surface = Color(0xFFFFFFFF); // Fondo blanco
  static const Color surfaceMuted = Color(0xFFF7F7F7); // Fondo gris muy claro
  static const Color surfaceHint = Color(
    0xFFF0F0F0,
  ); // Sutil variante de superficie

  // Brand Palette (derivada del ícono)
  static const Color primaryYellow = Color(
    0xFFFFDB00,
  ); // Amarillo principal (% y pulsera)
  static const Color secondaryYellow = Color(0xFFE5C000); // Amarillo sombra
  static const Color deepBlack = Color(0xFF1A1A1A); // Negro principal
  static const Color pureWhite = Color(0xFFFFFFFF);

  // Blues for UI elements
  static const Color primaryBlue = Color(
    0xFF1976D2,
  ); // Azul principal para headers
  static const Color secondaryBlue = Color(0xFF1565C0); // Azul secundario
  static const Color lightBlue = Color(0xFFE3F2FD); // Azul claro para fondos

  // Tonos de piel (por si los usas en ilustraciones, cards, etc.)
  static const Color skinLight = Color(0xFFF7D9C2);
  static const Color skinShadow = Color(0xFFE7B693);

  // Conservamos el verde de WhatsApp por si lo usas en botones de contacto
  static const Color whatsappGreen = Color(0xFF00FF7F);

  // Accent
  static const Color accentPrimary = primaryYellow;
  static const Color accentSecondary = secondaryYellow;
  static const Color accentInfo = deepBlack;
  static const Color accentPromo = pureWhite;
  static const Color accentHighlight = Color(
    0xFFFFF6B3,
  ); // Amarillo muy claro para fondos
  static const Color accentDanger = Color(0xFFFF5A5F); // Rojo solo para errores
  static const Color accentWhatsapp = whatsappGreen;

  // Legacy - mantener compatibilidad
  static const Color flareRed = accentDanger;
  static const Color emberOrange = secondaryYellow;
  static const Color pulseMagenta = deepBlack;

  // Status
  static const Color statusSuccess = Color(0xFF31B579);
  static const Color statusWarning = Color(0xFFFFAF3F);
  static const Color statusError = Color(0xFFFF5A5F);
  static const Color statusOffline = Color(0xFF9C9C9C);

  // Semantic roles
  static const Color primary = accentPrimary; // Botones principales -> amarillo
  static const Color onPrimary =
      neutralsInk; // Texto sobre botón amarillo -> negro
  static const Color primaryContainer = accentSecondary;
  static const Color onPrimaryContainer = neutralsInk;
  static const Color onSurface = neutralsInk;
  static const Color surfaceMutedColor = surfaceMuted;
  static const Color onSurfaceMuted = inkSoft;
  static const Color surfaceVariant = surfaceHint;
  static const Color onSurfaceVariant = inkSoft;
  static const Color outline = line;
  static const Color error = statusError;
  static const Color onError = neutralsSurface;
  static const Color success = statusSuccess;
  static const Color warning = statusWarning;

  // Legacy compatibility
  static const Color neutralsInk = ink;
  static const Color neutralsSurface = surface;
  static const Color secondary = accentSecondary;
  static const Color background = surfaceMuted;
  static const Color onBackground = ink;
}
