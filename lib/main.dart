import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/chat/presentation/pages/chat_page.dart';
import 'features/schedule/presentation/pages/schedule_page.dart';
import 'features/courses/presentation/pages/courses_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar formateo de fechas para español
  await initializeDateFormatting('es_ES', null);
  
  // Inicializar configuración
  await AppConfig.initialize();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración de rutas con GoRouter
    final router = GoRouter(
      initialLocation: AppRoutes.splash,
      routes: [
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppRoutes.chat,
          builder: (context, state) => const ChatPage(),
        ),
        GoRoute(
          path: AppRoutes.schedule,
          builder: (context, state) => const SchedulePage(),
        ),
        GoRoute(
          path: AppRoutes.courses,
          builder: (context, state) => const CoursesPage(),
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: AppRoutes.tasks,
          builder: (context, state) => const _PlaceholderPage('Tareas'),
        ),
        GoRoute(
          path: AppRoutes.resources,
          builder: (context, state) => const _PlaceholderPage('Recursos'),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const _PlaceholderPage('Configuración'),
        ),
        GoRoute(
          path: AppRoutes.about,
          builder: (context, state) => const _PlaceholderPage('Acerca de'),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'JUANIA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final String title;

  const _PlaceholderPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1e40af),
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              '$title - Próximamente',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
