import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/views/welcome/welcome.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key = const ValueKey('WelcomePageKey')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                top: kToolbarHeight,
                child: Text(
                  'Welcome!',
                  key: const ValueKey('welcomeText'),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ElevatedButtonCustom(title: 'Sign up'),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ElevatedButton(
                      key: const ValueKey('buttonLogin'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text('Log in'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key = const ValueKey('LoginPageKey')})
      : super(key: key);

  @override
  State createState() => LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _modalBottomSheet(_formKey, _usernameController, _passwordController);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthentificationState?>(
          bloc: context.read<AuthenticationBloc>(),
          listener: (_, state) {
            if (state is AuthenticationAuthenticated) {
              BotToast.cleanAll();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            }
          },
        ),
        BlocListener<LoginBloc, LoginState?>(
          bloc: context.read<LoginBloc>(),
          listener: (_, state) {
            if (state is LoginFailure) {
              BotToast.cleanAll();
              BotToast.showSimpleNotification(
                title: 'Email o contraseña incorrecta',
                backgroundColor: Colors.red.withOpacity(0.9),
                backButtonBehavior: BackButtonBehavior.ignore,
                titleStyle: const TextStyle(
                  color: Colors.white,
                ),
                hideCloseButton: true,
              );
            } else if (state is LoginLoading) {
              BotToast.showLoading(
                  backButtonBehavior: BackButtonBehavior.ignore);
            }
          },
        ),
      ],
      child: Scaffold(
        body: BackgroundImage(
          child: SafeArea(
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Positioned(
                top: kToolbarHeight,
                child: Text(
                  'Welcome!',
                  key: const ValueKey('welcomeText'),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _validateForm() =>
      _formKey.currentState!.validate() ? _onLoginButtonPressed() : null;

  void _onLoginButtonPressed() {
    context.read<LoginBloc>().add(LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ));
  }

  void _modalBottomSheet(
      Key? formKey,
      TextEditingController? usernameController,
      TextEditingController? passwordController) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await ModalBottomSheet.showModalBottomSheetCustom(
        context: context,
        isDismissible: false,
        enableDrag: false,
        backgroundColor: Constants.secondColor.withOpacity(0.9),
        onPressedClose: () {
          //Close ModalBottomSheet
          Navigator.pop(context);
          //Go to Back
          Navigator.pop(context);
        },
        contentModal: Form(
          key: formKey,
          child: Column(
            children: [
              TextFieldCustom(
                  key: const ValueKey('userTextForm'),
                  hintText: 'Name',
                  controller: usernameController),
              const SizedBox(height: 40),
              TextFieldCustom(
                  key: const ValueKey('passwordTextForm'),
                  hintText: 'Password',
                  controller: passwordController),
            ],
          ),
        ),
        contentBottomModal: ElevatedButton(
          key: const ValueKey('buttonLogin'),
          onPressed: () => _validateForm(),
          child: const Text('Log in'),
        ),
      );
    });
  }
}
