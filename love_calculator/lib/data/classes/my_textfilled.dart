import 'package:flutter/material.dart';

class MyTextfilled extends StatelessWidget {
  const MyTextfilled({
    super.key,
    required this.texthint,
    required this.profile,
    required this.controller,
  });

  final String texthint;
  final Icon profile;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 0.6)),
          labelText: texthint,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          fillColor: const Color.fromRGBO(255, 255, 255, 0),
          prefixIcon: profile,
        ),
      ),
    );
  }
}
