import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_calculator/pages/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center everything vertically
          children: [
            // Centered text section
            Column(
              children: [
                Text(
                  "Just kidding😜",
                  style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(206, 19, 56, 1),
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Press the button👇",
                  style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    wordSpacing: 2,
                  ),
                ),
              ],
            ),
            // Space between text and button (adjust height as needed)
            SizedBox(
              height: screenHeight * 0.2,
            ), // Example: 20% of screen height
            // Button
            Center(
              child: SizedBox(
                width: screenWidth * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(206, 19, 56, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.roboto(
                      letterSpacing: 3,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
