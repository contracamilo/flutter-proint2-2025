import '../../domain/entities/user_entity.dart';

/// Data Model: UserModel
/// Extiende UserEntity para reutilizar el shape del dominio y
/// agrega utilidades de serialización (fromJson/toJson) propias de Data.
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      token: json['token']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'token': token,
      };
}
