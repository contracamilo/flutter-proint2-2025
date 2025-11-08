# Tests - JUANIA

Este directorio contiene las pruebas automatizadas para la aplicación JUANIA.

## Estructura de Tests

```
test/
├── widget_test.dart              # Tests de la aplicación principal
├── unit/                         # Tests unitarios
│   ├── utils/                    # Tests de utilidades
│   │   ├── validators_test.dart
│   │   ├── date_formatter_test.dart
│   │   └── utils_test.dart
│   └── models/                   # Tests de modelos
│       ├── user_model_test.dart
│       └── course_model_test.dart
└── widget/                       # Tests de widgets
    └── login_page_test.dart
```

## Tipos de Tests

### 1. Tests Unitarios (`unit/`)
Prueban funciones y clases de forma aislada.

**Validators Tests** (`validators_test.dart`):
- ✅ Validación de campos requeridos
- ✅ Validación de emails
- ✅ Validación de longitud mínima y máxima
- ✅ Validación de números

**DateFormatter Tests** (`date_formatter_test.dart`):
- ✅ Formateo de fechas
- ✅ Formateo de horas
- ✅ Detección de "hoy" y "mañana"
- ✅ Tiempo relativo (hace X minutos/horas/días)

**Utils Tests** (`utils_test.dart`):
- ✅ Capitalización de strings
- ✅ Truncado de texto
- ✅ Generación de colores desde strings

**Model Tests** (`models/`):
- ✅ Serialización JSON (fromJson/toJson)
- ✅ Validación de datos
- ✅ Conversión de entidades

### 2. Tests de Widgets (`widget/`)
Prueban componentes de UI.

**LoginPage Tests** (`login_page_test.dart`):
- ✅ Renderizado de campos de texto
- ✅ Presencia de botones
- ✅ Interacción con formularios
- ✅ Diseño responsive

### 3. Tests de Integración (`widget_test.dart`)
Prueban la aplicación completa.

- ✅ Construcción de la app sin errores
- ✅ Configuración de navegación
- ✅ Configuración de temas

## Ejecutar Tests

### Todos los tests
```bash
flutter test
```

### Test específico
```bash
flutter test test/unit/utils/validators_test.dart
```

### Tests con cobertura
```bash
flutter test --coverage
```

### Ver reporte de cobertura (requiere lcov)
```bash
# En macOS
brew install lcov

# Generar reporte HTML
genhtml coverage/lcov.info -o coverage/html

# Abrir reporte
open coverage/html/index.html
```

## Comandos Útiles

```bash
# Ver tests en modo watch (se re-ejecutan al guardar cambios)
flutter test --watch

# Tests con output detallado
flutter test --verbose

# Tests de un directorio específico
flutter test test/unit/

# Tests que coinciden con un patrón
flutter test --plain-name "validators"
```

## Cobertura Actual

- **Tests Unitarios**: 5 archivos, ~80 assertions
- **Tests de Widgets**: 2 archivos, ~15 assertions
- **Total**: ~95 assertions

## Buenas Prácticas

1. **Nomenclatura**: Los archivos de test terminan en `_test.dart`
2. **Organización**: Usa `group()` para agrupar tests relacionados
3. **Descripción**: Nombres descriptivos en español para los tests
4. **Arrange-Act-Assert**: Estructura clara en cada test
5. **Aislamiento**: Cada test debe ser independiente

## Ejemplo de Test

```dart
group('Validators -', () {
  test('retorna error cuando el valor es null', () {
    // Arrange: Preparar datos
    final valor = null;
    
    // Act: Ejecutar función
    final resultado = Validators.required(valor);
    
    // Assert: Verificar resultado
    expect(resultado, 'Este campo es requerido');
  });
});
```

## Próximos Tests a Implementar

- [ ] Tests para repositorios
- [ ] Tests para providers/state management
- [ ] Tests de integración de navegación
- [ ] Tests de widgets complejos (Schedule, Courses)
- [ ] Tests E2E con flutter_driver

## Recursos

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [flutter_test package](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html)
- [Effective Dart: Testing](https://dart.dev/guides/language/effective-dart/testing)
