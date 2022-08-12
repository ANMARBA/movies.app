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
                      onPressed: () {},
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
