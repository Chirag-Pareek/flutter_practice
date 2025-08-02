import 'package:flutter/material.dart';
import 'package:love_calculator/widget/widget_tree.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const LoveCal());
}

class LoveCal extends StatelessWidget {
  const LoveCal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.robotoMonoTextTheme()),
      home: WidgetTree(),
    );
  }
}
