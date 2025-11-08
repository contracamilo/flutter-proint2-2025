import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:juania/features/auth/presentation/pages/login_page.dart';

void main() {
  group('LoginPage Widget Tests -', () {
    testWidgets('muestra el título JuanIA', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Verificar que el título está presente
      expect(find.text('JuanIA'), findsOneWidget);
    });

    testWidgets('muestra el subtítulo', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      expect(find.text('El Copiloto Académico de La Salle'), findsOneWidget);
    });

    testWidgets('muestra el botón de SSO', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Buscar el botón con el texto de SSO
      expect(
        find.text('Ingresar con Credenciales Institucionales (SSO)'),
        findsOneWidget,
      );
    });

    testWidgets('muestra texto informativo sobre credenciales', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      expect(
        find.text('Usa tus credenciales de La Salle para acceder de forma segura'),
        findsOneWidget,
      );
    });

    testWidgets('muestra el ícono del robot', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Verificar que hay un ícono (FaIcon)
      expect(find.byWidgetPredicate((widget) => widget.runtimeType.toString().contains('FaIcon')), findsWidgets);
    });

    testWidgets('el botón de SSO es clickeable', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      final ssoButton = find.text('Ingresar con Credenciales Institucionales (SSO)');
      
      // Verificar que el botón existe
      expect(ssoButton, findsOneWidget);
      
      // Intentar hacer tap
      await tester.tap(ssoButton);
      await tester.pump();
      
      // Verificar que aparece el SnackBar con el mensaje
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('SSO pendiente de integrar'), findsOneWidget);
    });

    testWidgets('tiene el color de fondo correcto', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, const Color(0xFF0E2C5A));
    });

    testWidgets('tiene un diseño responsive con constraints', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Verificar que usa SafeArea
      expect(find.byType(SafeArea), findsOneWidget);
      
      // Verificar que hay ConstrainedBox (hay varios, buscar el del contenido principal)
      expect(find.byType(ConstrainedBox), findsWidgets);
      
      // Verificar que al menos uno tiene el constraint de 420
      final constrainedBoxes = tester.widgetList<ConstrainedBox>(find.byType(ConstrainedBox));
      final hasMaxWidth420 = constrainedBoxes.any((box) => box.constraints.maxWidth == 420);
      expect(hasMaxWidth420, isTrue);
    });

    testWidgets('ejecuta callback onStartSSO cuando se provee', (tester) async {
      bool callbackExecuted = false;

      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            onStartSSO: () async {
              callbackExecuted = true;
            },
          ),
        ),
      );

      final ssoButton = find.text('Ingresar con Credenciales Institucionales (SSO)');
      
      // Hacer tap en el botón
      await tester.tap(ssoButton);
      await tester.pump();
      
      // Verificar que el callback fue ejecutado
      expect(callbackExecuted, isTrue);
    });

    testWidgets('LoginPage es un StatelessWidget', (tester) async {
      const loginPage = LoginPage();
      expect(loginPage, isA<StatelessWidget>());
    });
  });
}

