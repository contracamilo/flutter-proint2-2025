import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_constants.dart';

class AppDrawer extends StatelessWidget {
  final int currentIndex;

  const AppDrawer({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1e40af),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        'MG',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'María González',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Estudiante',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.home,
                    label: 'Inicio',
                    isActive: currentIndex == 0,
                    onTap: () {
                      context.go(AppRoutes.home);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: FontAwesomeIcons.comments,
                    label: 'Chat IA',
                    isActive: currentIndex == 1,
                    onTap: () {
                      context.push(AppRoutes.chat);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.calendar_today,
                    label: 'Horario',
                    isActive: currentIndex == 2,
                    onTap: () {
                      context.push(AppRoutes.schedule);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.school,
                    label: 'Cursos',
                    onTap: () {
                      context.push(AppRoutes.courses);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.task_alt,
                    label: 'Tareas',
                    onTap: () {
                      context.push(AppRoutes.tasks);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.library_books,
                    label: 'Recursos',
                    onTap: () {
                      context.push(AppRoutes.resources);
                      Navigator.of(context).pop();
                    },
                  ),
                  const Divider(height: 24),
                  _buildDrawerItem(
                    context,
                    icon: Icons.person,
                    label: 'Perfil',
                    isActive: currentIndex == 3,
                    onTap: () {
                      context.push(AppRoutes.profile);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.settings,
                    label: 'Configuración',
                    onTap: () {
                      context.push(AppRoutes.settings);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info_outline,
                    label: 'Acerca de',
                    onTap: () {
                      context.push(AppRoutes.about);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JUANIA v1.0.0',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Asistente Inteligente para\nEstudiantes Universitarios',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFEFF6FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? const Color(0xFF1e40af) : const Color(0xFF6B7280),
          size: 22,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? const Color(0xFF1e40af) : const Color(0xFF1F2937),
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
