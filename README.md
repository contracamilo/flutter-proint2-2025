# 🎓 JUANIA - Asistente Inteligente para Estudiantes Universitarios

[![Flutter Version](https://img.shields.io/badge/Flutter-3.0%2B-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

JUANIA es un asistente inteligente diseñado específicamente para estudiantes universitarios, ayudándoles a organizar su vida académica de manera eficiente y accesible.

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Arquitectura](#-arquitectura)
- [Requisitos](#-requisitos)
- [Instalación](#-instalación)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Tecnologías](#-tecnologías)
- [Configuración](#-configuración)
- [Desarrollo](#-desarrollo)
- [Pruebas](#-pruebas)
- [Despliegue](#-despliegue)
- [Contribuir](#-contribuir)
- [Licencia](#-licencia)

## ✨ Características

### Versión 1.0 (MVP)
- 🏠 **Dashboard Intuitivo**: Vista general de tareas y horarios
- 💬 **Chat Asistente**: Interacción conversacional para consultas académicas
- 📅 **Gestión de Horarios**: Organiza tus clases y actividades
- ✅ **Control de Tareas**: Seguimiento de trabajos y entregas
- 📚 **Gestión de Materias**: Información centralizada de tus cursos

### Futuras Características
- 🤖 **IA Integrada**: Asistencia con IA para resolución de dudas
- 🔔 **Notificaciones Inteligentes**: Recordatorios personalizados
- 📊 **Analytics Académico**: Visualización de tu progreso
- 👥 **Colaboración**: Grupos de estudio y compartir recursos
- 🌐 **Multi-idioma**: Soporte para inglés y español

## 🏗️ Arquitectura

Este proyecto sigue una **arquitectura modular y escalable** basada en:

### Clean Architecture (Simplificada)
```
lib/
├── core/                    # Núcleo de la aplicación
│   ├── config/             # Configuración global
│   ├── constants/          # Constantes de la app
│   ├── theme/              # Temas y estilos
│   ├── utils/              # Utilidades y helpers
│   └── widgets/            # Widgets reutilizables
├── features/               # Características por módulo
│   ├── home/              # Módulo de inicio
│   ├── chat/              # Módulo de chat
│   └── schedule/          # Módulo de horarios
└── main.dart              # Punto de entrada
```

### Principios Aplicados
- **Separación de Responsabilidades**: Cada módulo es independiente
- **Reutilización**: Componentes compartidos en `core/`
- **Escalabilidad**: Fácil agregar nuevas features
- **Mantenibilidad**: Código limpio y documentado
- **Testeable**: Estructura que facilita pruebas unitarias

## 📦 Requisitos

- **Flutter SDK**: 3.0.0 o superior
- **Dart SDK**: 3.0.0 o superior
- **IDE**: VS Code, Android Studio o IntelliJ IDEA
- **Dispositivos**: 
  - Android: API 21+ (Android 5.0+)
  - iOS: iOS 12.0+
  - Web: Navegadores modernos

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/contracamilo/flutter-proint2-2025.git
cd flutter-proint2-2025
```

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Configurar variables de entorno

```bash
# Copiar el archivo de ejemplo
cp .env.example .env

# Editar .env con tus configuraciones
nano .env
```

### 4. Ejecutar la aplicación

```bash
# Desarrollo
flutter run

# En dispositivo específico
flutter run -d <device_id>

# Ver dispositivos disponibles
flutter devices
```

## 📁 Estructura del Proyecto

```
juania/
├── assets/                      # Recursos estáticos
│   ├── icons/                  # Íconos de la app
│   └── images/                 # Imágenes
├── lib/
│   ├── core/
│   │   ├── config/
│   │   │   └── app_config.dart          # Configuración global
│   │   ├── constants/
│   │   │   └── app_constants.dart       # Constantes
│   │   ├── theme/
│   │   │   ├── app_colors.dart          # Paleta de colores
│   │   │   └── app_theme.dart           # Tema de la app
│   │   ├── utils/
│   │   │   └── helpers.dart             # Funciones auxiliares
│   │   └── widgets/
│   │       └── common_widgets.dart      # Widgets reutilizables
│   ├── features/
│   │   ├── home/
│   │   │   └── presentation/
│   │   │       ├── pages/
│   │   │       │   └── home_page.dart
│   │   │       └── widgets/
│   │   ├── chat/
│   │   │   └── presentation/
│   │   └── schedule/
│   │       └── presentation/
│   └── main.dart                        # Punto de entrada
├── test/                                # Pruebas unitarias
├── .env                                 # Variables de entorno (no subir)
├── .env.example                         # Ejemplo de variables
├── .gitignore                          # Archivos ignorados por Git
├── analysis_options.yaml               # Reglas de análisis
├── pubspec.yaml                        # Dependencias
└── README.md                           # Este archivo
```

## 🛠️ Tecnologías

### Core
- **Flutter**: Framework de UI multiplataforma
- **Dart**: Lenguaje de programación

### State Management
- **Provider**: Gestión de estado simple y eficiente

### Navegación
- **go_router**: Navegación declarativa

### Storage
- **Hive**: Base de datos local NoSQL (ligera y rápida)
- **SharedPreferences**: Almacenamiento clave-valor

### Networking
- **Dio**: Cliente HTTP robusto
- **http**: Cliente HTTP básico

### UI/UX
- **Google Fonts**: Tipografías personalizadas
- **Flutter SVG**: Soporte para SVG
- **Font Awesome**: Biblioteca de íconos

### Utils
- **intl**: Internacionalización y formateo
- **logger**: Sistema de logging
- **equatable**: Comparación de objetos
- **flutter_dotenv**: Variables de entorno

### Desarrollo
- **flutter_lints**: Reglas de linting
- **build_runner**: Generación de código

## ⚙️ Configuración

### Variables de Entorno

Configura las siguientes variables en tu archivo `.env`:

```env
# API Configuration
API_BASE_URL=http://localhost:3000/api
API_TIMEOUT=30000

# App Configuration
APP_NAME=JUANIA
APP_ENV=development
DEBUG_MODE=true

# Futuras integraciones (opcional)
# GEMINI_API_KEY=your_api_key
# FIREBASE_PROJECT_ID=your_project_id
```

### Configuración de Desarrollo

```bash
# Activar modo debug
flutter run --debug

# Ver logs
flutter logs

# Análisis de código
flutter analyze

# Formatear código
flutter format .
```

## 💻 Desarrollo

### Agregar una nueva feature

1. Crear la estructura en `lib/features/nombre_feature/`
2. Implementar la lógica de presentación
3. Agregar rutas en la configuración de navegación
4. Documentar cambios

### Estilo de Código

Seguimos las convenciones de Dart y Flutter:

```dart
// Usar const cuando sea posible
const Text('Hola');

// Preferir comillas simples
final String mensaje = 'Hola mundo';

// Nombres descriptivos
void cargarDatosDelUsuario() { ... }

// Documentar funciones públicas
/// Carga los datos del usuario desde la API
Future<User> fetchUser(String id) async { ... }
```

### Commits

Usamos [Conventional Commits](https://www.conventionalcommits.org/):

```bash
feat: Agregar módulo de chat
fix: Corregir error en horarios
docs: Actualizar README
style: Formatear código
refactor: Mejorar estructura de widgets
test: Agregar pruebas para home
chore: Actualizar dependencias
```

## 🧪 Pruebas

```bash
# Ejecutar todas las pruebas
flutter test

# Ejecutar con cobertura
flutter test --coverage

# Ver cobertura
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 🚢 Despliegue

### Android

```bash
# Generar APK
flutter build apk --release

# Generar App Bundle
flutter build appbundle --release
```

### iOS

```bash
# Generar IPA
flutter build ios --release
```

### Web

```bash
# Generar build para web
flutter build web --release
```

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/amazing-feature`)
3. Commit tus cambios (`git commit -m 'feat: Add amazing feature'`)
4. Push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

Ver [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles.

## 📄 Licencia

Este proyecto es software académico desarrollado en la Universidad. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 👥 Equipo

Proyecto desarrollado como parte del curso de Desarrollo Móvil.

## 📞 Contacto

Para dudas o sugerencias:
- 📧 Email: [Tu email]
- 🐛 Issues: [GitHub Issues](https://github.com/contracamilo/flutter-proint2-2025/issues)

---

**Nota**: Este es un proyecto académico con fines educativos. Se priorizan soluciones gratuitas y open-source para hacerlo accesible a estudiantes.

## 🙏 Agradecimientos

- Flutter Team por el increíble framework
- Comunidad open-source por las librerías utilizadas
- Universidad por el apoyo al proyecto

---

**Hecho con ❤️ por estudiantes, para estudiantes**
