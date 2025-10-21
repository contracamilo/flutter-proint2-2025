import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/common_widgets.dart';

/// Página principal de JUANIA
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Páginas de navegación (temporal)
  static const List<Widget> _pages = <Widget>[
    _HomeView(),
    _ChatView(),
    _ScheduleView(),
    _ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JUANIA'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implementar notificaciones
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Horario',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// Vista de Inicio
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Saludo
          Text(
            '¡Hola, Estudiante! 👋',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Bienvenido a JUANIA, tu asistente universitario',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 24),

          // Accesos rápidos
          Text(
            'Accesos Rápidos',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              _QuickAccessCard(
                icon: Icons.schedule,
                title: 'Mi Horario',
                color: AppColors.primary,
                onTap: () {},
              ),
              _QuickAccessCard(
                icon: Icons.assignment,
                title: 'Tareas',
                color: AppColors.secondary,
                onTap: () {},
              ),
              _QuickAccessCard(
                icon: Icons.book,
                title: 'Materias',
                color: AppColors.success,
                onTap: () {},
              ),
              _QuickAccessCard(
                icon: Icons.event,
                title: 'Eventos',
                color: AppColors.warning,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Próximas clases
          Text(
            'Próximas Clases',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          const EmptyStateWidget(
            message: 'No hay clases programadas para hoy',
            icon: Icons.event_available,
          ),
        ],
      ),
    );
  }
}

// Vista de Chat
class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: EmptyStateWidget(
        message: 'Inicia una conversación con JUANIA',
        icon: Icons.chat_bubble_outline,
        actionLabel: 'Nuevo Chat',
      ),
    );
  }
}

// Vista de Horario
class _ScheduleView extends StatelessWidget {
  const _ScheduleView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: EmptyStateWidget(
        message: 'Configura tu horario académico',
        icon: Icons.calendar_today_outlined,
        actionLabel: 'Agregar Horario',
      ),
    );
  }
}

// Vista de Perfil
class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      children: [
        // Avatar y nombre
        const Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: AppColors.textOnPrimary,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Nombre del Estudiante',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'estudiante@universidad.edu.co',
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Opciones
        CustomCard(
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 8),
        CustomCard(
          child: ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Ayuda'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 8),
        CustomCard(
          child: ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Acerca de'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

// Widget de tarjeta de acceso rápido
class _QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _QuickAccessCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
