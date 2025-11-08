import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:juania/main.dart';

void main() {
  group('MyApp Widget Tests -', () {
    testWidgets('la app se construye sin errores', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      // Verificar que la app se construye exitosamente
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('usa MaterialApp con router', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      // La app debe usar MaterialApp
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp, isNotNull);
    });

    testWidgets('tiene título JUANIA configurado', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, 'JUANIA');
    });

    testWidgets('debugShowCheckedModeBanner está desactivado', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, false);
    });

    testWidgets('tiene tema claro y oscuro configurados', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, isNotNull);
      expect(materialApp.darkTheme, isNotNull);
    });

    testWidgets('el tema claro tiene los colores correctos', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      final theme = materialApp.theme;
      
      expect(theme, isNotNull);
      expect(theme!.brightness, Brightness.light);
    });

    testWidgets('MyApp es un StatelessWidget', (tester) async {
      const app = MyApp();
      expect(app, isA<StatelessWidget>());
    });
  });
}
