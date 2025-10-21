# 🚀 Quick Start - JUANIA

## Pasos Rápidos para Empezar

### 1️⃣ Instalar Dependencias

```bash
flutter pub get
```

### 2️⃣ Verificar Instalación

```bash
# Ver dispositivos disponibles
flutter devices

# Verificar que no hay errores
flutter analyze
```

### 3️⃣ Ejecutar la App

```bash
# En desarrollo
flutter run

# En dispositivo específico
flutter run -d <device_id>

# En Chrome (web)
flutter run -d chrome
```

### 4️⃣ Comandos Útiles

```bash
# Formatear código
flutter format .

# Limpiar build
flutter clean

# Reinstalar dependencias
flutter pub get

# Ver logs
flutter logs

# Hot reload: presiona 'r' en la terminal
# Hot restart: presiona 'R' en la terminal
```

## 📁 Archivos Importantes

- **`lib/main.dart`** - Punto de entrada
- **`lib/features/home/presentation/pages/home_page.dart`** - Página principal
- **`lib/core/theme/app_theme.dart`** - Tema de la app
- **`lib/core/config/app_config.dart`** - Configuración
- **`.env`** - Variables de entorno

## 🎨 Personalizar

### Cambiar Colores

Edita `lib/core/theme/app_colors.dart`:

```dart
static const Color primary = Color(0xFF1976D2); // Tu color
```

### Cambiar Nombre de App

Edita `pubspec.yaml`:

```yaml
name: juania  # Cambia aquí
```

### Agregar Imágenes

1. Coloca imágenes en `assets/images/`
2. Ya están configuradas en `pubspec.yaml`
3. Usa: `Image.asset('assets/images/tu-imagen.png')`

## 🐛 Solución de Problemas

### Error: "Flutter command not found"

```bash
# Verificar instalación
which flutter

# Si no está, agregar al PATH
export PATH="$PATH:/path/to/flutter/bin"
```

### Error: "Pub get failed"

```bash
flutter clean
flutter pub get
```

### Error: "No devices found"

```bash
# Para Android
- Abrir Android Studio
- Iniciar emulador

# Para iOS (solo Mac)
open -a Simulator

# Para Web
flutter run -d chrome
```

### Errores de Build

```bash
# Limpiar todo
flutter clean
rm -rf ios/Pods
rm -rf ios/.symlinks
flutter pub get
cd ios && pod install && cd ..
flutter run
```

## 📱 Emuladores

### Android

1. Abrir Android Studio
2. AVD Manager
3. Create Virtual Device
4. Iniciar emulador

### iOS (solo Mac)

```bash
# Abrir simulador
open -a Simulator

# Listar simuladores
xcrun simctl list devices
```

### Web

```bash
# Habilitar web
flutter config --enable-web

# Ejecutar en Chrome
flutter run -d chrome
```

## 🔥 Atajos de Teclado

Mientras la app está corriendo:

- **`r`** - Hot reload (recargar cambios)
- **`R`** - Hot restart (reiniciar app)
- **`h`** - Ayuda
- **`q`** - Salir
- **`o`** - Cambiar plataforma
- **`d`** - Detach

## 📦 Agregar Dependencias

1. Editar `pubspec.yaml`:

```yaml
dependencies:
  nueva_dependencia: ^1.0.0
```

2. Instalar:

```bash
flutter pub get
```

## 🎯 Próximo Paso

Lee la documentación completa en:
- **`README.md`** - Documentación general
- **`docs/BEST_PRACTICES.md`** - Mejores prácticas
- **`docs/PROJECT_SUMMARY.md`** - Resumen del proyecto

## 🆘 Ayuda

- [Flutter Docs](https://docs.flutter.dev/)
- [Flutter Community](https://flutter.dev/community)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)

---

**¡Listo para desarrollar! 🚀**
