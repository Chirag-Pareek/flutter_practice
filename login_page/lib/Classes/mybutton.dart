import 'package:flutter/material.dart';

class Mybutton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Mybutton1({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.blue,
      child: Text(text),
    );
  }
}

class Mybutton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Mybutton2({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: const Size(220, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ), // Fixed size for the button
        // Custom color\
        splashFactory: NoSplash.splashFactory,
      ),

      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
