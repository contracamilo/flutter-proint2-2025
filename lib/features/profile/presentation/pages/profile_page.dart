import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/profile_entity.dart';
import '../../data/models/profile_model.dart';
import '../widgets/profile_header_card.dart';
import '../../../../core/widgets/navigation/app_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileEntity _profile;
  bool _highContrast = false;
  double _fontSizeMultiplier = 1.0;
  bool _intelligentNotifications = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadProfile();
    _loadPreferences();
  }

  Future<void> _loadProfile() async {
    const profile = ProfileModel(
      id: '1',
      name: 'María González',
      email: 'maria.gonzalez@universidaddelasalle.edu.co',
      university: 'Universidad de La Salle',
      authMethod: 'SSO',
      preferredLanguage: 'es',
    );
    setState(() => _profile = profile);
  }

  Future<void> _loadPreferences() async {
    setState(() {
      _highContrast = false;
      _fontSizeMultiplier = 1.0;
      _intelligentNotifications = true;
    });
  }

  Future<void> _savePreferences() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF9FAFB),
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1e40af),
        elevation: 0,
        title: const Text('Perfil', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeaderCard(profile: _profile),
            _buildSectionHeader('Preferencias de Uso'),
            _buildLanguagePreference(),
            _buildAccessibilitySection(),
            _buildFontSizeControl(),
            _buildNotificationsSection(),
            _buildSectionHeader('Privacidad y Seguridad de Datos'),
            _buildPrivacySection(),
            _buildDataExportSection(),
            _buildSecuritySection(),
            _buildSectionHeader('Soporte y Sesión'),
            _buildSupportSection(),
            _buildLogoutButton(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
    );
  }

  Widget _buildLanguagePreference() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.language, color: const Color(0xFF1e40af), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Idioma', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Selecciona tu idioma preferido', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF9CA3AF)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(6)),
            child: const Text('Español', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF1F2937))),
          ),
        ],
      ),
    );
  }

  Widget _buildAccessibilitySection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.accessibility, color: const Color(0xFF9333EA), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Accesibilidad', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Ajustes de visualización', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: const Color(0xFFF0FDF4), borderRadius: BorderRadius.circular(4)),
                child: const Text('Cumple WCAG 2.1 AA', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Color(0xFF16A34A))),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Alto Contraste', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  const SizedBox(height: 2),
                  Text('Mejora la legibilidad con\nmayor contraste', style: TextStyle(fontSize: 11, color: Colors.grey.shade600, height: 1.3)),
                ],
              ),
              Switch(
                value: _highContrast,
                onChanged: (value) {
                  setState(() => _highContrast = value);
                  _savePreferences();
                },
                activeColor: const Color(0xFF1e40af),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFontSizeControl() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tamaño de Fuente', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('A', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
              const SizedBox(width: 10),
              Expanded(
                child: Slider(
                  value: _fontSizeMultiplier,
                  min: 0.8,
                  max: 1.4,
                  divisions: 6,
                  onChanged: (value) {
                    setState(() => _fontSizeMultiplier = value);
                    _savePreferences();
                  },
                  activeColor: const Color(0xFF1e40af),
                  inactiveColor: Colors.grey.shade300,
                ),
              ),
              const SizedBox(width: 10),
              const Text('A', style: TextStyle(fontSize: 16, color: Color(0xFF6B7280))),
            ],
          ),
          const SizedBox(height: 6),
          Text('${(_fontSizeMultiplier * 100).toStringAsFixed(0)}%', style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
        ],
      ),
    );
  }

  Widget _buildNotificationsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.notifications, color: const Color(0xFFEA580C), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Notificaciones', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Configura tus recordatorios', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text('Activar Notificaciones Inteligentes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF1F2937))),
              ),
              Switch(
                value: _intelligentNotifications,
                onChanged: (value) {
                  setState(() => _intelligentNotifications = value);
                  _savePreferences();
                },
                activeColor: const Color(0xFF1e40af),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
            child: const Text('Configurar', style: TextStyle(fontSize: 12, color: Color(0xFF1e40af), fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacySection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shield, color: const Color(0xFF1e40af), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Privacidad', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Revisa y modifica tus consentimientos de datos', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Gestionar Consentimientos', style: TextStyle(fontSize: 12, color: Color(0xFF1e40af), fontWeight: FontWeight.w500)),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios, size: 12, color: Color(0xFF1e40af)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataExportSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.download, color: const Color(0xFF1e40af), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Exportar Mis Datos', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Descarga todos tus datos personales (GDPR)', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download, size: 18),
              label: const Text('Exportar Datos', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1e40af), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 10)),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFBFDBFE))),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF2563EB), size: 18),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Garantizamos la portabilidad de tus datos según GDPR y normativas de privacidad.',
                      style: TextStyle(fontSize: 11, color: Color(0xFF2563EB))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecuritySection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified_user, color: const Color(0xFF16A34A), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Seguridad Adicional', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Protege tu cuenta con seguridad adicional', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFF0FDF4), borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFBBF7D0))),
            child: const Row(
              children: [
                Icon(Icons.check_circle, color: Color(0xFF16A34A), size: 18),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Autenticación de Dos Factores (MFA)\nAñade una capa adicional de seguridad',
                      style: TextStyle(fontSize: 11, color: Color(0xFF16A34A))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.help_outline, color: const Color(0xFF1e40af), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Ayuda y Soporte', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Obtén ayuda con JuanIA', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.support_agent, size: 16),
                    label: const Text('Centro de Ayud', style: TextStyle(fontSize: 11)),
                    style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFF1e40af), side: const BorderSide(color: Color(0xFF1e40af))),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 36,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined, size: 16),
                    label: const Text('Contactar Sopor', style: TextStyle(fontSize: 11)),
                    style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFF1e40af), side: const BorderSide(color: Color(0xFF1e40af))),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.exit_to_app, color: const Color(0xFFDC2626), size: 22),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Cerrar Sesión', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
                  SizedBox(height: 2),
                  Text('Finalizar tu sesión de forma segura', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('¿Cerrar sesión?'),
                    content: const Text('Tendrás que iniciar sesión nuevamente para acceder a tu cuenta.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Cerrar Sesión', style: TextStyle(color: Color(0xFFDC2626))),
                      ),
                    ],
                  ),
                );
                if (confirmed == true && mounted) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  if (mounted) context.go(AppRoutes.splash);
                }
              },
              icon: const Icon(Icons.exit_to_app, size: 18),
              label: const Text('Cerrar Sesión', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC2626), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
