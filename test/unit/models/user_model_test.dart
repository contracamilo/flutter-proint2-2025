import 'package:flutter_test/flutter_test.dart';
import 'package:juania/features/auth/data/models/user_model.dart';

void main() {
  group('UserModel -', () {
    const testUserJson = {
      'id': '123',
      'name': 'Juan Pérez',
      'token': 'abc123token',
    };

    const testUser = UserModel(
      id: '123',
      name: 'Juan Pérez',
      token: 'abc123token',
    );

    group('fromJson', () {
      test('crea un UserModel desde JSON válido', () {
        final user = UserModel.fromJson(testUserJson);
        
        expect(user.id, '123');
        expect(user.name, 'Juan Pérez');
        expect(user.token, 'abc123token');
      });

      test('maneja valores null usando valores por defecto', () {
        final json = {
          'id': null,
          'name': null,
          'token': null,
        };
        
        final user = UserModel.fromJson(json);
        
        expect(user.id, '');
        expect(user.name, '');
        expect(user.token, '');
      });

      test('maneja JSON vacío', () {
        final user = UserModel.fromJson({});
        
        expect(user.id, '');
        expect(user.name, '');
        expect(user.token, '');
      });

      test('convierte tipos numéricos a string', () {
        final json = {
          'id': 123,
          'name': 'Test',
          'token': 456,
        };
        
        final user = UserModel.fromJson(json);
        
        expect(user.id, '123');
        expect(user.token, '456');
      });
    });

    group('toJson', () {
      test('convierte UserModel a JSON correctamente', () {
        final json = testUser.toJson();
        
        expect(json['id'], '123');
        expect(json['name'], 'Juan Pérez');
        expect(json['token'], 'abc123token');
      });

      test('el JSON generado contiene todas las propiedades', () {
        final json = testUser.toJson();
        
        expect(json.keys, containsAll(['id', 'name', 'token']));
      });
    });

    group('serialización completa', () {
      test('fromJson y toJson son operaciones inversas', () {
        final user = UserModel.fromJson(testUserJson);
        final json = user.toJson();
        final userAgain = UserModel.fromJson(json);
        
        expect(userAgain.id, user.id);
        expect(userAgain.name, user.name);
        expect(userAgain.token, user.token);
      });
    });

    group('igualdad', () {
      test('dos usuarios con los mismos valores son iguales', () {
        const user1 = UserModel(
          id: '1',
          name: 'Test',
          token: 'token',
        );
        
        const user2 = UserModel(
          id: '1',
          name: 'Test',
          token: 'token',
        );
        
        expect(user1.id, user2.id);
        expect(user1.name, user2.name);
        expect(user1.token, user2.token);
      });
    });
  });
}
