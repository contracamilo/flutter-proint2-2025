import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_constants.dart';

/// Pantalla de Login (SSO)
/// Esqueleto con un botón para iniciar el flujo SSO. El obtainIdToken
/// se implementará en una iteración posterior (redirección al IdP y BFF).
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onStartSSO});

  /// Callback opcional para iniciar el flujo SSO desde fuera
  final Future<void> Function()? onStartSSO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2C5A), // Azul profundo cercano al mock
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingL),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo circular placeholder
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white12,
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.robot,
                        size: 52,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'JuanIA',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFF7CE3E), // Amarillo del botón/título
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'El Copiloto Académico de La Salle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFF7CE3E), // Amarillo
                        foregroundColor: const Color(0xFF1A1A1A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      icon: const FaIcon(FontAwesomeIcons.rightToBracket),
                      label: const Text(
                        'Ingresar con Credenciales Institucionales (SSO)'
                      ),
                      onPressed: () async {
                        if (onStartSSO != null) {
                          await onStartSSO!();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('SSO pendiente de integrar')),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Usa tus credenciales de La Salle para acceder de forma segura',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
