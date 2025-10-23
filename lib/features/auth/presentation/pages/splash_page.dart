import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../data/repositories/auth_repository_fake.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Pantalla de bienvenida (Splash) siguiendo el mock adjunto
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _checkExistingSession();
  }

  Future<void> _checkExistingSession() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSession =
        prefs.getBool(AppConstants.prefKeyLoggedIn) ?? false;
    final token = prefs.getString(AppConstants.prefKeyAuthToken);
    if (hasSession && token != null && token.isNotEmpty) {
      if (!mounted) return;
      context.go(AppRoutes.home);
    }
  }

  Future<void> _startMockSSO() async {
    if (_loading) return;
    setState(() => _loading = true);

    try {
      // Simula obtención de idToken desde IdP
      const mockIdToken = 'mock-id-token-abc';
  final repo = AuthRepositoryFake();
  final user = await repo.performSSOLogin(mockIdToken);

  // Persistir sesión mock
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(AppConstants.prefKeyUserId, user.id);
  await prefs.setString(AppConstants.prefKeyUserName, user.name);
  await prefs.setString(AppConstants.prefKeyAuthToken, user.token);
  await prefs.setBool(AppConstants.prefKeyLoggedIn, true);

      if (!mounted) return;
      context.go(AppRoutes.home);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo iniciar sesión: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132A5E), // Navy cercano al mock
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  const Spacer(flex: 3),

                  // Logo circular placeholder con ícono
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.06),
                      border: Border.all(color: const Color(0xFF3B7BFF), width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.robot,
                        size: 56,
                        color: Color(0xFF9C7BFF), // Lila del mock
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Título JuanIA en amarillo
                  const Text(
                    'JuanIA',
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFF7CE3E),
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 8),
                  const Text(
                    'El Copiloto Académico de La Salle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),

                  const Spacer(flex: 4),

                  // Botón SSO
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFF7CE3E),
                        foregroundColor: const Color(0xFF1A1A1A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 1.5,
                        shadowColor: Colors.black.withValues(alpha: 0.25),
                      ),
                      icon: _loading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const FaIcon(FontAwesomeIcons.arrowRightLong),
                      label: const Text('Ingresar con Credenciales Institucionales (SSO)'),
                      onPressed: _loading ? null : _startMockSSO,
                    ),
                  ),

                  const SizedBox(height: 14),
                  const Text(
                    'Usa tus credenciales de La Salle para acceder de forma segura',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
