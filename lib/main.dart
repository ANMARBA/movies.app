import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:movies_app/bloc/login/login.dart';
import 'package:movies_app/commons/widgets/widgets.dart';
import 'package:movies_app/data/repositories/home_repository_impl.dart';
import 'package:movies_app/data/repositories/user_repository_impl.dart';
import 'package:movies_app/data/services/authentification_service_impl.dart';
import 'package:movies_app/data/services/home_service_impl.dart';
import 'package:movies_app/domain/services/authentification_service.dart';
import 'package:movies_app/domain/services/home_service.dart';
import 'package:movies_app/views/home/pages/home_page.dart';
import 'package:movies_app/views/welcome/pages/welcome_page.dart';

import 'bloc/home/home.dart';

void main() async {
  // Allows for async code in main method
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthentificationService>(
          create: (_) => AuthentificationServiceImpl(),
        ),
        RepositoryProvider<HomeService>(
          create: (_) => HomeServiceImpl(),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(
              authentificationService: context.read<AuthentificationService>()),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) =>
              HomeRepositoryImpl(homeService: context.read<HomeService>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
                userRepository: context.read<UserRepository>())
              ..add(AppStarted()),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              userRepository: context.read<UserRepository>(),
              authenticationBloc: context.read<AuthenticationBloc>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            child = botToastBuilder(context, child);
            return ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: child,
            );
          },
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            // Define the default font family.
            fontFamily: 'Gilroy',

            // Define the default `TextTheme`. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              headline2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              headline3: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ).apply(
              displayColor: Colors.white,
            ),

            // Define the default `elevatedButtonTheme`. Use this to specify the default
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: const Size(150, 40),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                textStyle:
                    Theme.of(context).textTheme.button?.copyWith(fontSize: 16),
                splashFactory: NoSplash.splashFactory,
              ),
            ),
          ),
          home: BlocBuilder<AuthenticationBloc, AuthentificationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return const HomePage();
              } else if (state is AuthenticationUnauthenticated) {
                return const WelcomePage();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
