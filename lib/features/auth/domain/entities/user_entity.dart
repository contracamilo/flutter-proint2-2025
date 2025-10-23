/// Domain Entity: UserEntity
/// No depende de Flutter ni de paquetes de infraestructura.
/// Representa al usuario autenticado dentro del dominio.
class UserEntity {
  final String id;
  final String name;
  final String token; // Token de sesión emitido por el BFF tras validar el SSO

  const UserEntity({
    required this.id,
    required this.name,
    required this.token,
  });
}
