import 'package:flutter_test/flutter_test.dart';
import 'package:juania/core/utils/helpers.dart';

void main() {
  group('Validators -', () {
    group('required', () {
      test('retorna error cuando el valor es null', () {
        final result = Validators.required(null);
        expect(result, 'Este campo es requerido');
      });

      test('retorna error cuando el valor está vacío', () {
        final result = Validators.required('');
        expect(result, 'Este campo es requerido');
      });

      test('retorna error cuando el valor solo tiene espacios', () {
        final result = Validators.required('   ');
        expect(result, 'Este campo es requerido');
      });

      test('retorna null cuando el valor es válido', () {
        final result = Validators.required('Valor válido');
        expect(result, isNull);
      });

      test('usa mensaje personalizado cuando se provee', () {
        final result = Validators.required(null, message: 'Campo obligatorio');
        expect(result, 'Campo obligatorio');
      });
    });

    group('email', () {
      test('retorna error cuando el email es null', () {
        final result = Validators.email(null);
        expect(result, 'El email es requerido');
      });

      test('retorna error cuando el email está vacío', () {
        final result = Validators.email('');
        expect(result, 'El email es requerido');
      });

      test('retorna error cuando el email no tiene @', () {
        final result = Validators.email('invalidemail.com');
        expect(result, 'Ingresa un email válido');
      });

      test('retorna error cuando el email no tiene dominio', () {
        final result = Validators.email('invalid@');
        expect(result, 'Ingresa un email válido');
      });

      test('retorna null cuando el email es válido', () {
        final result = Validators.email('usuario@ejemplo.com');
        expect(result, isNull);
      });

      test('acepta emails con subdominios', () {
        final result = Validators.email('usuario@mail.ejemplo.com');
        expect(result, isNull);
      });
    });

    group('minLength', () {
      test('retorna error cuando el valor es null', () {
        final result = Validators.minLength(null, 5);
        expect(result, 'Este campo es requerido');
      });

      test('retorna error cuando el valor es más corto que el mínimo', () {
        final result = Validators.minLength('abc', 5);
        expect(result, 'Mínimo 5 caracteres');
      });

      test('retorna null cuando el valor cumple la longitud mínima', () {
        final result = Validators.minLength('12345', 5);
        expect(result, isNull);
      });

      test('retorna null cuando el valor excede la longitud mínima', () {
        final result = Validators.minLength('123456', 5);
        expect(result, isNull);
      });
    });

    group('number', () {
      test('retorna error cuando el valor es null', () {
        final result = Validators.number(null);
        expect(result, 'Este campo es requerido');
      });

      test('retorna error cuando el valor no es numérico', () {
        final result = Validators.number('abc');
        expect(result, 'Ingresa un número válido');
      });

      test('retorna null cuando el valor es un entero', () {
        final result = Validators.number('123');
        expect(result, isNull);
      });

      test('retorna null cuando el valor es un decimal', () {
        final result = Validators.number('123.45');
        expect(result, isNull);
      });

      test('retorna null cuando el valor es negativo', () {
        final result = Validators.number('-123');
        expect(result, isNull);
      });
    });
  });
}
