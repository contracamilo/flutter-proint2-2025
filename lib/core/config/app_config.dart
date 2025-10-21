import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

/// Configuración de la aplicación
/// Carga variables de entorno y configuraciones iniciales
class AppConfig {
  static late String apiBaseUrl;
  static late String appName;
  static late String appEnv;
  static late bool debugMode;
  static late int apiTimeout;
  
  // Logger
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  /// Inicializa la configuración de la aplicación
  static Future<void> initialize() async {
    try {
      // Cargar variables de entorno
      await dotenv.load(fileName: '.env');
      
      apiBaseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000/api';
      appName = dotenv.env['APP_NAME'] ?? 'JUANIA';
      appEnv = dotenv.env['APP_ENV'] ?? 'development';
      debugMode = dotenv.env['DEBUG_MODE'] == 'true';
      apiTimeout = int.tryParse(dotenv.env['API_TIMEOUT'] ?? '30000') ?? 30000;
      
      logger.i('🚀 AppConfig initialized successfully');
      logger.d('Environment: $appEnv');
      logger.d('API Base URL: $apiBaseUrl');
    } catch (e) {
      logger.e('❌ Error loading environment variables', error: e);
      // Usar valores por defecto
      apiBaseUrl = 'http://localhost:3000/api';
      appName = 'JUANIA';
      appEnv = 'development';
      debugMode = true;
      apiTimeout = 30000;
    }
  }

  /// Determina si la app está en modo desarrollo
  static bool get isDevelopment => appEnv == 'development';

  /// Determina si la app está en modo producción
  static bool get isProduction => appEnv == 'production';

  // Prevenir instanciación
  AppConfig._();
}
