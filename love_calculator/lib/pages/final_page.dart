import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FinalPage extends StatelessWidget {
  final String
  name1; // 👈 Still passed, not used visually but may be used later
  final String name2; // 👈 Still passed
  final String percentage;
  final String result;

  const FinalPage({
    super.key,
    required this.name1,
    required this.name2,
    required this.percentage,
    required this.result,
  });

  String capitalize(String name) {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.5,
              child: Lottie.asset(
                "Assets/lottie/logo.json",
                width: screenWidth * 1,
                animate: true,
                repeat: true,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      'Animation failed to load',
                      style: GoogleFonts.roboto(
                        color: Colors.red,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              "${capitalize(name1)} ❤️ ${capitalize(name2)}",
              style: GoogleFonts.roboto(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            // 💖 Display percentage (centered)
            Text(
              percentage, // e.g. "84.7%"
              style: GoogleFonts.roboto(
                color: const Color.fromRGBO(206, 19, 56, 1),
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            // 💌 Display result text (centered)
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                result,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: const Color.fromRGBO(48, 158, 183, 1),
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.w900,
                  letterSpacing: screenWidth * 0.01,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
