import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  const BackgroundImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      alignment: FractionalOffset.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/welcome_screen.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
