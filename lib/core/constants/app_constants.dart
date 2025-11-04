/// Constantes de la aplicación JUANIA
/// Centraliza valores constantes para fácil mantenimiento
class AppConstants {
  // Información de la app
  static const String appName = 'JUANIA';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Asistente Inteligente para Estudiantes Universitarios';
  
  // URLs y endpoints
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000/api',
  );
  
  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration shortTimeout = Duration(seconds: 10);
  
  // Límites
  static const int maxMessageLength = 500;
  static const int maxFileSize = 5 * 1024 * 1024; // 5MB
  static const int itemsPerPage = 20;
  
  // Keys para almacenamiento local
  static const String prefKeyThemeMode = 'theme_mode';
  static const String prefKeyLanguage = 'language';
  static const String prefKeyFirstLaunch = 'first_launch';
  static const String prefKeyUserId = 'user_id';
  static const String prefKeyUserName = 'user_name';
  static const String prefKeyAuthToken = 'auth_token';
  static const String prefKeyLoggedIn = 'logged_in';
  
  // Animaciones
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Espaciado
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  
  // Border radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusRound = 999.0;
  
  // Iconos
  static const double iconS = 16.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 48.0;

  // Prevenir instanciación
  AppConstants._();
}

/// Rutas de navegación
class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String chat = '/chat';
  static const String schedule = '/schedule';
  static const String courses = '/courses';
  static const String calendar = '/calendar';
  static const String tasks = '/tasks';
  static const String resources = '/resources';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';

  // Prevenir instanciación
  AppRoutes._();
}

/// Mensajes de la aplicación
class AppMessages {
  // Errores generales
  static const String errorGeneral = 'Ha ocurrido un error. Por favor, intenta de nuevo.';
  static const String errorNetwork = 'Error de conexión. Verifica tu internet.';
  static const String errorTimeout = 'La petición ha tardado demasiado.';
  static const String errorNotFound = 'Recurso no encontrado.';
  
  // Éxitos
  static const String successSaved = 'Guardado exitosamente';
  static const String successDeleted = 'Eliminado exitosamente';
  static const String successUpdated = 'Actualizado exitosamente';
  
  // Confirmaciones
  static const String confirmDelete = '¿Estás seguro de eliminar este elemento?';
  static const String confirmExit = '¿Deseas salir de la aplicación?';
  
  // Validaciones
  static const String validationRequired = 'Este campo es requerido';
  static const String validationEmail = 'Ingresa un email válido';
  static const String validationMinLength = 'Mínimo {0} caracteres';
  static const String validationMaxLength = 'Máximo {0} caracteres';

  // Prevenir instanciación
  AppMessages._();
}
