import 'package:flutter/material.dart';

import 'package:movies_app/views/welcome/welcome.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    _modalBottomSheet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Stack(alignment: AlignmentDirectional.center, children: [
            Positioned(
              top: kToolbarHeight,
              child: Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _modalBottomSheet() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await ModalBottomSheet.showModalBottomSheetCustom(
        context: context,
        isDismissible: false,
        enableDrag: false,
        backgroundColor: Constants.secondColor.withOpacity(0.9),
        onPressedClose: () {
          Navigator.pop(context);
        },
        contentModal: Column(
          children: const [
            TextFieldCustom(hintText: 'Name'),
            SizedBox(height: 40),
            TextFieldCustom(hintText: 'Password'),
          ],
        ),
        contentBottomModal: ElevatedButton(
          onPressed: () {},
          child: const Text('Log in'),
        ),
      );
    });
  }
}
