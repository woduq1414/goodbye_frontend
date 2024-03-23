import 'package:flutter/material.dart';
import 'package:goodbye_frontend/commons/color.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  State<BottomButton> createState() => _BottomButtonState(
    text: text,
    onPressed: onPressed,
  );
}

class _BottomButtonState extends State<BottomButton> {


  _BottomButtonState({required this.text, required this.onPressed});

  String text;
  void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    // button
    return Container(
      width: 342,
      height: 49,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white),)
      ),
    );
  }
}
