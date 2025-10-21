import 'package:intl/intl.dart';

/// Utilidades para formateo de fechas
class DateFormatter {
  /// Formatea una fecha en formato dd/MM/yyyy
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Formatea una fecha en formato completo
  static String formatDateLong(DateTime date) {
    return DateFormat('EEEE, d \'de\' MMMM \'de\' yyyy', 'es_ES').format(date);
  }

  /// Formatea una hora en formato HH:mm
  static String formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  /// Formatea fecha y hora
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  /// Retorna tiempo relativo (hace 5 minutos, hace 2 horas, etc.)
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Hace ${difference.inSeconds} segundos';
    } else if (difference.inMinutes < 60) {
      return 'Hace ${difference.inMinutes} minutos';
    } else if (difference.inHours < 24) {
      return 'Hace ${difference.inHours} horas';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} días';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return 'Hace $weeks semanas';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return 'Hace $months meses';
    } else {
      final years = (difference.inDays / 365).floor();
      return 'Hace $years años';
    }
  }

  /// Determina si una fecha es hoy
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }

  /// Determina si una fecha es mañana
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year && 
           date.month == tomorrow.month && 
           date.day == tomorrow.day;
  }

  // Prevenir instanciación
  DateFormatter._();
}

/// Utilidades para validación
class Validators {
  /// Valida que un campo no esté vacío
  static String? required(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'Este campo es requerido';
    }
    return null;
  }

  /// Valida email
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email es requerido';
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(value)) {
      return 'Ingresa un email válido';
    }
    return null;
  }

  /// Valida longitud mínima
  static String? minLength(String? value, int min) {
    if (value == null || value.isEmpty) {
      return 'Este campo es requerido';
    }
    
    if (value.length < min) {
      return 'Mínimo $min caracteres';
    }
    return null;
  }

  /// Valida longitud máxima
  static String? maxLength(String? value, int max) {
    if (value != null && value.length > max) {
      return 'Máximo $max caracteres';
    }
    return null;
  }

  /// Valida número
  static String? number(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es requerido';
    }
    
    if (int.tryParse(value) == null && double.tryParse(value) == null) {
      return 'Ingresa un número válido';
    }
    return null;
  }

  // Prevenir instanciación
  Validators._();
}

/// Utilidades generales
class Utils {
  /// Capitaliza la primera letra de un string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Trunca un texto a una longitud específica
  static String truncate(String text, int maxLength, {String suffix = '...'}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}$suffix';
  }

  /// Formatea un número a moneda (pesos colombianos)
  static String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
      symbol: r'$',
      decimalDigits: 0,
      locale: 'es_CO',
    );
    return formatter.format(amount);
  }

  /// Genera un color a partir de un string (para avatares)
  static int colorFromString(String text) {
    int hash = 0;
    for (int i = 0; i < text.length; i++) {
      hash = text.codeUnitAt(i) + ((hash << 5) - hash);
    }
    return hash;
  }

  // Prevenir instanciación
  Utils._();
}
