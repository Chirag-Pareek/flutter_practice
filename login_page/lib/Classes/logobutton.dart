import 'package:flutter/material.dart';

class Logobutton extends StatelessWidget {
  final String imagePath;
  final String pagePath;
  final VoidCallback? onTap; // Add this

  const Logobutton({
    super.key,
    required this.imagePath,
    required this.pagePath,
    this.onTap, // Add this
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            Navigator.pushNamed(context, pagePath);
          },
      child: Container(
        width: 10,
        height: 40,

        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
              blurStyle: BlurStyle.solid, // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: double.infinity, // or 48
            width: double.infinity, // or 48
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
