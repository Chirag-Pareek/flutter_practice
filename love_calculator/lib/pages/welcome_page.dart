import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with custom height and padding
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
              // Text content
              Text(
                "Heart detected",
                style: GoogleFonts.roboto(
                  color: const Color.fromRGBO(206, 19, 56, 1),
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Prepare for joy overload!",
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(48, 158, 183, 1),
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.10),
              Text(
                "Swipe right on happiness",
                style: GoogleFonts.roboto(
                  color: const Color.fromRGBO(0, 0, 0, 0.4),
                  fontSize: screenWidth * 0.04,
                ),
              ), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
