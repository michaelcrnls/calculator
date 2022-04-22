import 'package:calculus/utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = getTextColor(text);
    final double fontSize = Utils.isOperator(text, hasEquals: true) ? 30 : 25;
    final style = TextStyle(
        color: color, fontSize: fontSize, fontWeight: FontWeight.bold);

    return Expanded(
      child: Container(
        height: double.infinity, //this will take the complete height
        margin: const EdgeInsets.all(13),
        child: ElevatedButton(
          onPressed: onClicked,
          style: ElevatedButton.styleFrom(
              primary: Colors.grey.shade500,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28))),
          child: text == '<'
              ? Icon(Icons.backspace_outlined, color: color)
              : Text(text, style: style),
        ),
      ),
    );
  }

  Color getTextColor(String buttonText) {
    switch (buttonText) {
      case '+':
      case '/':
      case '-':
      case '*':
      case '=':
        return Colors.yellow.shade600;
      case 'AC':
      case '<':
        return Colors.green.shade900;
      default:
        return Colors.white;
    }
  }
}
