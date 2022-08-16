import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/views/welcome/pages/welcome_page.dart';

void main() {
  testWidgets(
    'Welcome Page',
    (WidgetTester tester) async {
      // Allows for async code in main method
      WidgetsFlutterBinding.ensureInitialized();
      // Initialize Hive
      await Hive.initFlutter();

      await tester.pumpWidget(const MyApp(widgetTest: WelcomePage()));

      await tester.pumpAndSettle();

      final welcomeTextFinder = find.byKey(const ValueKey('welcomeText'));
      final buttonLoginFinder = find.byKey(const ValueKey('buttonLogin'));

      expect(welcomeTextFinder, findsOneWidget);
      expect(buttonLoginFinder, findsOneWidget);

      expect(find.text('Welcome!'), findsOneWidget);
      expect(find.text('Log in'), findsOneWidget);
      expect(find.text('Forgot password?'), findsOneWidget);

      await tester.ensureVisible(buttonLoginFinder);
      await tester.tap(buttonLoginFinder);
      await tester.pump();
    },
  );
}
