import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required String id,
    required String name,
    required String email,
    required String university,
    String? photoUrl,
    required String authMethod,
    String preferredLanguage = 'es',
    bool highContrast = false,
    double fontSizeMultiplier = 1.0,
    bool notificationsEnabled = true,
    bool intelligentNotifications = true,
    bool twoFactorAuthEnabled = false,
  }) : super(
    id: id,
    name: name,
    email: email,
    university: university,
    photoUrl: photoUrl,
    authMethod: authMethod,
    preferredLanguage: preferredLanguage,
    highContrast: highContrast,
    fontSizeMultiplier: fontSizeMultiplier,
    notificationsEnabled: notificationsEnabled,
    intelligentNotifications: intelligentNotifications,
    twoFactorAuthEnabled: twoFactorAuthEnabled,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: (json['id'] ?? '') as String,
      name: (json['name'] ?? '') as String,
      email: (json['email'] ?? '') as String,
      university: (json['university'] ?? '') as String,
      photoUrl: json['photoUrl'] as String?,
      authMethod: (json['authMethod'] ?? 'SSO') as String,
      preferredLanguage: (json['preferredLanguage'] ?? 'es') as String,
      highContrast: (json['highContrast'] ?? false) as bool,
      fontSizeMultiplier: ((json['fontSizeMultiplier'] ?? 1.0) as num).toDouble(),
      notificationsEnabled: (json['notificationsEnabled'] ?? true) as bool,
      intelligentNotifications: (json['intelligentNotifications'] ?? true) as bool,
      twoFactorAuthEnabled: (json['twoFactorAuthEnabled'] ?? false) as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'university': university,
      'photoUrl': photoUrl,
      'authMethod': authMethod,
      'preferredLanguage': preferredLanguage,
      'highContrast': highContrast,
      'fontSizeMultiplier': fontSizeMultiplier,
      'notificationsEnabled': notificationsEnabled,
      'intelligentNotifications': intelligentNotifications,
      'twoFactorAuthEnabled': twoFactorAuthEnabled,
    };
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      name: name,
      email: email,
      university: university,
      photoUrl: photoUrl,
      authMethod: authMethod,
      preferredLanguage: preferredLanguage,
      highContrast: highContrast,
      fontSizeMultiplier: fontSizeMultiplier,
      notificationsEnabled: notificationsEnabled,
      intelligentNotifications: intelligentNotifications,
      twoFactorAuthEnabled: twoFactorAuthEnabled,
    );
  }
}
