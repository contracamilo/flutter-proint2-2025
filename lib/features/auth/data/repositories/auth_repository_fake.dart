import 'dart:async';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

/// Repositorio 'fake' para simular el flujo SSO sin backend
class AuthRepositoryFake implements AuthRepository {
  final Duration delay;

  AuthRepositoryFake({this.delay = const Duration(milliseconds: 900)});

  @override
  Future<UserEntity> performSSOLogin(String idToken) async {
    // Simula la validación del idToken y el intercambio por token de sesión
    await Future<void>.delayed(delay);

    // Retorna un usuario estático para pruebas locales
    return const UserEntity(
      id: 'mock-user-123',
      name: 'María González',
      token: 'mock-session-token-xyz',
    );
  }
}
