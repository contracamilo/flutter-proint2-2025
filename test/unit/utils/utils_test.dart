import 'package:flutter_test/flutter_test.dart';
import 'package:juania/core/utils/helpers.dart';

void main() {
  group('Utils -', () {
    group('capitalize', () {
      test('capitaliza la primera letra de un string en minúsculas', () {
        final result = Utils.capitalize('hola mundo');
        expect(result, 'Hola mundo');
      });

      test('capitaliza un string completamente en mayúsculas', () {
        final result = Utils.capitalize('HOLA MUNDO');
        expect(result, 'Hola mundo');
      });

      test('maneja correctamente un string vacío', () {
        final result = Utils.capitalize('');
        expect(result, '');
      });

      test('capitaliza un string de un solo carácter', () {
        final result = Utils.capitalize('a');
        expect(result, 'A');
      });
    });

    group('truncate', () {
      test('trunca un texto largo correctamente', () {
        final text = 'Este es un texto muy largo que debe ser truncado';
        final result = Utils.truncate(text, 20);
        expect(result, 'Este es un texto muy...');
      });

      test('no trunca si el texto es más corto que el límite', () {
        final text = 'Texto corto';
        final result = Utils.truncate(text, 20);
        expect(result, 'Texto corto');
      });

      test('trunca exactamente en el límite', () {
        final text = 'Exacto';
        final result = Utils.truncate(text, 6);
        expect(result, 'Exacto');
      });

      test('usa sufijo personalizado', () {
        final text = 'Este es un texto largo';
        final result = Utils.truncate(text, 10, suffix: '---');
        expect(result, 'Este es un---');
      });
    });

    group('colorFromString', () {
      test('genera el mismo color para el mismo string', () {
        final color1 = Utils.colorFromString('test');
        final color2 = Utils.colorFromString('test');
        expect(color1, color2);
      });

      test('genera colores diferentes para strings diferentes', () {
        final color1 = Utils.colorFromString('test1');
        final color2 = Utils.colorFromString('test2');
        expect(color1, isNot(color2));
      });

      test('genera un número entero', () {
        final color = Utils.colorFromString('test');
        expect(color, isA<int>());
      });
    });
  });
}
