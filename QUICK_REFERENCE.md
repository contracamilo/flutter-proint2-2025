# 🚀 QUICK START - Página de Horario

## ⚡ En 30 segundos

```bash
# 1. Ejecutar la app
flutter run

# 2. Navega al Home
# 3. Toca "Horario" en cualquier lugar
# 4. ¡Disfruta del horario! 📅
```

---

## 📍 Dónde Encontrar la Función

### Ubicaciones en la App
```
Home Page
├── 🎯 Botón Quick Access "Horario" (arriba)
├── 🎯 Tab "Horario" en Bottom Navigation (abajo)
└── → Ambos van a la misma SchedulePage
```

### Ubicaciones en el Código
```
lib/
├── main.dart                                    ← Ruta /schedule
├── features/
│   ├── home/presentation/pages/home_page.dart  ← Navegación (2 puntos)
│   └── schedule/
│       ├── domain/entities/schedule_entity.dart
│       ├── data/models/schedule_model.dart
│       └── presentation/
│           ├── pages/schedule_page.dart        ← Página principal
│           └── widgets/
│               ├── schedule_event_card.dart
│               └── horizontal_date_picker.dart
```

---

## 🎯 Funciones Principales

| Función | Cómo Usar | Resultado |
|---------|-----------|-----------|
| **Cambiar día** | Tap en día del calendario | Actualiza eventos del día |
| **Cambiar semana** | Botones ◄ ► | Navega semana anterior/siguiente |
| **Filtrar eventos** | Tap en tab (Todos/Clases/Exámenes/Eventos) | Muestra solo ese tipo |
| **Ver detalles** | Tap en evento | Abre modal con información |
| **Cerrar modal** | Tap fuera o botón cerrar | Vuelve a la lista |

---

## 📊 Datos de Ejemplo

Hay eventos para cada día de la semana (Lunes a Viernes):

```
LUNES 6/10       MARTES 7/10      MIÉRCOLES 8/10    JUEVES 9/10     VIERNES 10/10
─────────────    ──────────────   ───────────────   ────────────    ────────────
Cálculo          Examen Física    Métodos Numéricos Proyecto Final  Seminario
Programación     Estructuras
```

Tap en cualquier evento para ver detalles.

---

## 🔍 Solución de Problemas

### Problema: No veo la página de horario
**Solución**: 
- ✅ Verifica estar en Home
- ✅ Busca botón "Horario"
- ✅ Ejecuta `flutter clean` y `flutter pub get`

### Problema: No hay eventos visibles
**Solución**:
- ✅ Verifica el día seleccionado
- ✅ Revisa que el tab sea "Todos"
- ✅ Intenta navegar con ◄ ►

### Problema: La app no compila
**Solución**:
```bash
flutter clean
flutter pub get
flutter pub upgrade
flutter run
```

---

## 💻 Comandos Útiles

```bash
# Ejecutar la app
flutter run

# Con output detallado
flutter run -v

# En modo debug
flutter run --debug

# En modo release
flutter run --release

# Ver logs
flutter logs

# Limpiar y reconstruir
flutter clean && flutter pub get

# Formato de código
flutter format lib/features/schedule/

# Análisis estático
flutter analyze
```

---

## 📚 Documentación Disponible

| Documento | Para Quién | Contenido |
|-----------|-----------|----------|
| **SCHEDULE_GUIDE.md** | Usuarios | Cómo usar la interfaz |
| **SCHEDULE_IMPLEMENTATION.md** | Desarrolladores | Detalles técnicos |
| **IMPLEMENTATION_SUMMARY.md** | Gestores | Resumen del proyecto |
| **COMPLETE_STATUS.md** | Equipo | Estado completo |
| **README.md** | Generales | Visión general |

Lee cualquiera en VS Code o desde la terminal:
```bash
cat SCHEDULE_GUIDE.md
```

---

## 🎨 Personalización

### Cambiar Colores
Edita `lib/core/theme/app_colors.dart`

### Cambiar Tipografía
Edita `lib/core/theme/app_theme.dart`

### Agregar Nuevos Eventos
Modifica `_getEventsForDate()` en `schedule_page.dart`:

```dart
if (dayOfWeek == 1) { // Lunes
  return [
    ScheduleEntity(
      id: '1',
      title: 'Mi Nueva Clase',
      startTime: DateTime(date.year, date.month, date.day, 10, 0),
      endTime: DateTime(date.year, date.month, date.day, 11, 30),
      location: 'Aula 101',
      professor: 'Dr. Nombre',
      type: ScheduleEventType.clase,
      colorIndex: 0,
    ),
  ];
}
```

---

## ✅ Verificación

Ejecuta esto para verificar todo está bien:

```bash
# Análisis
flutter analyze

# Formatea código
flutter format .

# Compila sin errores
flutter build apk --debug

# Todo listo ✅
echo "¡Listo para usar!"
```

---

## 🎯 Próximas Mejoras

Si quieres agregar más funcionalidades:

1. **Base de Datos**: Reemplaza datos de ejemplo con Hive
2. **CRUD**: Crear/editar/eliminar eventos
3. **Notificaciones**: Recordatorios de clases
4. **Sincronización**: Conectar con Google Calendar
5. **Exportar**: Descargar como PDF o ICS

---

## 📞 Necesitas Ayuda?

```bash
# Ver la documentación técnica
cat docs/SCHEDULE_IMPLEMENTATION.md

# Ver la guía visual
cat SCHEDULE_GUIDE.md

# Ver el resumen completo
cat COMPLETE_STATUS.md

# Ver estado general
cat IMPLEMENTATION_SUMMARY.md
```

---

## 🎓 Pasos para Entender el Código

1. **Lee**: `lib/features/schedule/domain/entities/schedule_entity.dart`
   - Entiende la estructura de datos

2. **Revisa**: `lib/features/schedule/presentation/pages/schedule_page.dart`
   - Entiende la lógica de la página

3. **Explora**: Widgets en `presentation/widgets/`
   - Entiende los componentes UI

4. **Conecta**: Navega en `lib/main.dart`
   - Entiende cómo se conecta todo

---

## 🚀 Lanzar a Producción

```bash
# 1. Limpiar
flutter clean

# 2. Obtener dependencias
flutter pub get

# 3. Verificar
flutter analyze
flutter format .

# 4. Build de release
flutter build apk --release

# 5. Listo para deploy ✅
```

---

## 📱 Testeado en

- ✅ Android (API 21+)
- ✅ iOS (12.0+)
- ✅ Web (navegadores modernos)
- ✅ Tablet (responsive)

---

## 🎉 ¡Listo!

**La página de horario está completamente funcional.**

Pruébala ahora:
```bash
flutter run
```

Luego toca "Horario" en Home y ¡disfruta! 📅

---

**¿Preguntas?** Revisa la documentación completa en los archivos `.md` del proyecto.

**¿Problemas?** Usa `flutter doctor` y `flutter analyze` para diagnosticar.

**¡Éxito!** 🚀
