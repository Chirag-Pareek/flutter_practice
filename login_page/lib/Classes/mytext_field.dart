import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final IconData? suffixIcon;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    this.suffixIcon,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode _focusNode;
  bool isFocused = false;
  bool _obscureText = false; // <-- Initialize here

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
    _obscureText = widget.isPassword; // <-- Set here
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: isFocused ? Colors.black : const Color.fromARGB(170, 0, 0, 0),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: isFocused ? Colors.black : const Color.fromARGB(170, 0, 0, 0),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: isFocused
                      ? Colors.black
                      : const Color.fromARGB(170, 0, 0, 0),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : (widget.suffixIcon != null
                  ? Icon(
                      widget.suffixIcon,
                      color: isFocused
                          ? Colors.black
                          : const Color.fromARGB(170, 0, 0, 0),
                    )
                  : null),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
