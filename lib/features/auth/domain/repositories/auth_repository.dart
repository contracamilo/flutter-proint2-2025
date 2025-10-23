import '../entities/user_entity.dart';

/// Contrato del repositorio de autenticación.
/// Esta interfaz vive en Domain y no depende de ninguna tecnología específica.
abstract class AuthRepository {
  /// RF-01: Login con SSO institucional
  /// - [idToken]: token de identidad (por ejemplo, de Cognito/IdP) que
  ///   recibe el Mobile BFF para intercambiar por un token propio de sesión.
  /// - Devuelve un [UserEntity] autenticado.
  Future<UserEntity> performSSOLogin(String idToken);
}
