import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String university;
  final String? photoUrl;
  final String authMethod; // 'SSO', 'email', 'google', etc.
  final String preferredLanguage; // 'es', 'en', etc.
  final bool highContrast;
  final double fontSizeMultiplier; // 1.0 = 100%
  final bool notificationsEnabled;
  final bool intelligentNotifications;
  final bool twoFactorAuthEnabled;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.university,
    this.photoUrl,
    required this.authMethod,
    this.preferredLanguage = 'es',
    this.highContrast = false,
    this.fontSizeMultiplier = 1.0,
    this.notificationsEnabled = true,
    this.intelligentNotifications = true,
    this.twoFactorAuthEnabled = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        university,
        photoUrl,
        authMethod,
        preferredLanguage,
        highContrast,
        fontSizeMultiplier,
        notificationsEnabled,
        intelligentNotifications,
        twoFactorAuthEnabled,
      ];
}
