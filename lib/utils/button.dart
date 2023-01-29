import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  VoidCallback onPressed;
  Button({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(title),
    );
  }
}
