import 'package:dio/dio.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Implementación del repositorio de autenticación que conecta
/// la capa de dominio con la fuente de datos remota.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> performSSOLogin(String idToken) async {
    try {
      final model = await remoteDataSource.loginWithSSO(idToken: idToken);
      // En este esqueleto, UserModel extiende UserEntity, por lo que lo devolvemos tal cual
      return model;
    } on DioException catch (e) {
      // Mapear errores específicos si fuera necesario
      throw Exception('AuthRepositoryImpl Dio error: ${e.message}');
    } catch (e) {
      throw Exception('AuthRepositoryImpl error: $e');
    }
  }
}
