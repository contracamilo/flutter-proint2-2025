import 'package:flutter/material.dart';

/// Paleta de colores de JUANIA
/// Siguiendo principios de Material Design 3
class AppColors {
  // Colores primarios - Tema universitario profesional
  static const Color primary = Color(0xFF1976D2); // Azul universitario
  static const Color primaryDark = Color(0xFF0D47A1);
  static const Color primaryLight = Color(0xFF42A5F5);
  
  // Colores secundarios
  static const Color secondary = Color(0xFF00BCD4); // Cyan
  static const Color secondaryDark = Color(0xFF0097A7);
  static const Color secondaryLight = Color(0xFF4DD0E1);
  
  // Colores de acento
  static const Color accent = Color(0xFFFF6F00); // Naranja
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Colores de fondo
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF3F4F6);
  
  // Colores de texto
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  
  // Colores de bordes y divisores
  static const Color divider = Color(0xFFE0E0E0);
  static const Color border = Color(0xFFBDBDBD);
  
  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Prevenir instanciación
  AppColors._();
}
