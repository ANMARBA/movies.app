import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/views/welcome/pages/welcome_page.dart';

void main() {
  testWidgets(
    'Login Page',
    (WidgetTester tester) async {
      // Allows for async code in main method
      WidgetsFlutterBinding.ensureInitialized();
      // Initialize Hive
      await Hive.initFlutter();

      await tester.pumpWidget(const MyApp(widgetTest: LoginPage()));

      await tester.pumpAndSettle();

      final welcomeTextFinder = find.byKey(const ValueKey('welcomeText'));
      final buttonLoginFinder = find.byKey(const ValueKey('buttonLogin'));
      final userTextFormFinder = find.byKey(const ValueKey('userTextForm'));
      final passwordTextFormFinder =
          find.byKey(const ValueKey('passwordTextForm'));

      expect(welcomeTextFinder, findsOneWidget);
      expect(buttonLoginFinder, findsOneWidget);
      expect(userTextFormFinder, findsOneWidget);
      expect(passwordTextFormFinder, findsOneWidget);

      expect(find.text('Welcome!'), findsOneWidget);

      await tester.ensureVisible(buttonLoginFinder);
      await tester.tap(buttonLoginFinder);
      await tester.pump();

      final user = find.descendant(
        of: userTextFormFinder,
        matching: find.byType(TextField),
      );
      final TextField userTextForm = tester.widget(user);

      expect(userTextForm.decoration?.errorText,
          equals('Este campo es obligatorio'));

      final password = find.descendant(
        of: userTextFormFinder,
        matching: find.byType(TextField),
      );
      final TextField passwordTextForm = tester.widget(password);

      expect(passwordTextForm.decoration?.errorText,
          equals('Este campo es obligatorio'));
    },
  );
}
