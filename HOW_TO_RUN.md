# 🚀 Guía para levantar la app en cada plataforma

## Plataformas

### 📱 **iOS (Simulador)**

1. Abre el simulador de iOS:

   ```bash
   open -a Simulator
   ```

2. Ejecuta la app:

   ```bash
   flutter run -d ios
   ```

   O especifica el ID del dispositivo:

   ```bash
   flutter run -d 342D8D9A-B624-4117-BB57-6F3690558073
   ```

**Nota**: Para dispositivo físico iOS necesitas configurar firma de código en Xcode.

---

### 🤖 **Android (Emulador o Dispositivo)**

1. Abre Android Studio y lanza un emulador, o conecta un dispositivo físico con depuración USB habilitada.

2. Verifica que el dispositivo esté conectado:

   ```bash
   flutter devices
   ```

3. Ejecuta la app:

   ```bash
   flutter run -d android
   ```

**Alternativa**: Instala el APK generado directamente:

```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

---

### 🌐 **Web (Chrome)**

Ejecuta directamente:

```bash
flutter run -d chrome
```

O abre en un navegador específico:

```bash
flutter run -d web-server
```

Luego abre <http://localhost:PORT> en tu navegador.

---

### 💻 **macOS (Desktop)**

Ejecuta la app como aplicación de escritorio:

```bash
flutter run -d macos
```

---

### ⚡ **Comando universal (detecta automáticamente)**

Si solo hay un dispositivo disponible:

```bash
flutter run
```

---

### 🔍 **Ver todos los dispositivos disponibles**

```bash
flutter devices
```
