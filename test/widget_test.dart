import 'package:flutter_test/flutter_test.dart';
import 'package:juania/main.dart';

void main() {
  testWidgets('App should build without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app builds successfully
    expect(find.text('JUANIA'), findsOneWidget);
  });
}
