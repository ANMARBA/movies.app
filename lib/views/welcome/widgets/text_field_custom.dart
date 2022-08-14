import 'package:flutter/material.dart';
import 'package:movies_app/commons/constants/constants.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  const TextFieldCustom({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _inputBorder({Color color = Constants.thirdColor}) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
      );
    }

    return TextField(
      cursorColor: Constants.thirdColor,
      style: const TextStyle(color: Constants.thirdColor),
      decoration: InputDecoration(
        border: _inputBorder(),
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(color: Constants.thirdColor),
      ),
    );
  }
}
