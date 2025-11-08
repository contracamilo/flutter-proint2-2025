import 'package:flutter_test/flutter_test.dart';
import 'package:juania/core/utils/helpers.dart';

void main() {
  group('DateFormatter -', () {
    group('formatDate', () {
      test('formatea correctamente una fecha', () {
        final date = DateTime(2025, 11, 7);
        final result = DateFormatter.formatDate(date);
        expect(result, '07/11/2025');
      });

      test('formatea correctamente fechas con un solo dígito', () {
        final date = DateTime(2025, 1, 5);
        final result = DateFormatter.formatDate(date);
        expect(result, '05/01/2025');
      });
    });

    group('formatTime', () {
      test('formatea correctamente una hora', () {
        final time = DateTime(2025, 11, 7, 14, 30);
        final result = DateFormatter.formatTime(time);
        expect(result, '14:30');
      });

      test('formatea correctamente hora con minutos de un dígito', () {
        final time = DateTime(2025, 11, 7, 9, 5);
        final result = DateFormatter.formatTime(time);
        expect(result, '09:05');
      });
    });

    group('isToday', () {
      test('retorna true cuando la fecha es hoy', () {
        final now = DateTime.now();
        final result = DateFormatter.isToday(now);
        expect(result, isTrue);
      });

      test('retorna false cuando la fecha es ayer', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        final result = DateFormatter.isToday(yesterday);
        expect(result, isFalse);
      });

      test('retorna false cuando la fecha es mañana', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        final result = DateFormatter.isToday(tomorrow);
        expect(result, isFalse);
      });
    });

    group('isTomorrow', () {
      test('retorna true cuando la fecha es mañana', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        final result = DateFormatter.isTomorrow(tomorrow);
        expect(result, isTrue);
      });

      test('retorna false cuando la fecha es hoy', () {
        final today = DateTime.now();
        final result = DateFormatter.isTomorrow(today);
        expect(result, isFalse);
      });

      test('retorna false cuando la fecha es pasado mañana', () {
        final dayAfterTomorrow = DateTime.now().add(const Duration(days: 2));
        final result = DateFormatter.isTomorrow(dayAfterTomorrow);
        expect(result, isFalse);
      });
    });

    group('getRelativeTime', () {
      test('retorna segundos cuando es menos de un minuto', () {
        final time = DateTime.now().subtract(const Duration(seconds: 30));
        final result = DateFormatter.getRelativeTime(time);
        expect(result, contains('segundos'));
      });

      test('retorna minutos cuando es menos de una hora', () {
        final time = DateTime.now().subtract(const Duration(minutes: 30));
        final result = DateFormatter.getRelativeTime(time);
        expect(result, contains('minutos'));
      });

      test('retorna horas cuando es menos de un día', () {
        final time = DateTime.now().subtract(const Duration(hours: 5));
        final result = DateFormatter.getRelativeTime(time);
        expect(result, contains('horas'));
      });

      test('retorna días cuando es menos de una semana', () {
        final time = DateTime.now().subtract(const Duration(days: 3));
        final result = DateFormatter.getRelativeTime(time);
        expect(result, contains('días'));
      });
    });
  });
}
