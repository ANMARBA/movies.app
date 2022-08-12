import 'package:flutter/material.dart';
import 'package:movies_app/commons/constants/constants.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String title;
  const ElevatedButtonCustom({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: Constants.primaryColor),
      child: Text(title),
    );
  }
}
