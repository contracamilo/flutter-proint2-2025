import 'package:dio/dio.dart';
import '../models/user_model.dart';

/// Fuente de datos remota para autenticación.
/// Realiza la llamada HTTP al Mobile BFF para validar el SSO
/// e intercambiar el idToken del IdP por un token de sesión propio.
abstract class AuthRemoteDataSource {
  /// Llama al endpoint del BFF para realizar el login con SSO.
  /// Devuelve un [UserModel] con los datos del usuario autenticado.
  Future<UserModel> loginWithSSO({required String idToken});
}

/// Implementación con Dio
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  // El endpoint puede configurarse vía AppConfig o inyección externa.
  // Para el esqueleto dejaremos un path por defecto.
  final String baseUrl;

  AuthRemoteDataSourceImpl({required this.dio, required this.baseUrl});

  @override
  Future<UserModel> loginWithSSO({required String idToken}) async {
    try {
      // Explicit generic types for stronger checks
      final Response<Map<String, dynamic>> response =
          await dio.post<Map<String, dynamic>>(
        '$baseUrl/auth/sso',
        data: <String, dynamic>{
          'idToken': idToken,
        },
        options: Options(
          headers: const <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );

      final data = response.data ?? <String, dynamic>{};
      // Se asume que el BFF retorna un JSON con { id, name, token }
      return UserModel.fromJson(data);
    } on DioException catch (e) {
      // Re-lanzar como excepción genérica por ahora
      // (el manejo fino de errores se hará en otra iteración)
      throw Exception('AuthRemoteDataSource error: ${e.message}');
    }
  }
}
