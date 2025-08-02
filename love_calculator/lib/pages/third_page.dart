import 'package:flutter/material.dart';
import 'dart:math'; // ✅ Needed for random logic
import 'package:google_fonts/google_fonts.dart';
import 'package:love_calculator/Data/classes/my_textfilled.dart';
// import 'package:love_calculator/api/api_services.dart'; // ❌ No longer needed
import 'package:love_calculator/pages/final_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();

  Future<void> _calculateLove() async {
    String name1 = firstNameController.text.trim();
    String name2 = secondNameController.text.trim();

    if (name1.isEmpty || name2.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter both names")));
      return;
    }

    // ✅ Show loading dialog (good UX)
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // ❌ Don't use API anymore
      // final data = await LoveCalculatorService.getLoveResult(name1, name2);

      // ❌ Not needed without API
      // if (!context.mounted) return;
      // if (!mounted) return;

      // ✅ Close loading dialog
      Navigator.pop(context);

      // Custom logic for percentage and result
      final combined = name1.toLowerCase() + name2.toLowerCase();
      final asciiSum = combined.codeUnits.fold(0, (sum, code) => sum + code);
      final combinedLength = name1.length + name2.length;
      final seed = asciiSum + combinedLength;
      final rng = Random(seed);
      int rawPercent = rng.nextInt(100) + 1; // Gives value from 1 to 100
      String formattedPercentage = '$rawPercent%';

      // Result message using switch-style Hinglish logic
      String result;
      switch (rawPercent ~/ 10) {
        case 10:
        case 9:
          result = "Rab ne bana di jodi! ❤️ Bilkul perfect match!";
          break;
        case 8:
          result = "Dil garden garden ho gaya! 💕 Kuch toh baat hai!";
          break;
        case 7:
          result = "Ladka-ladki dono ready hain! 😍 Chemistry strong hai!";
          break;
        case 6:
          result = "Thoda effort lagega, par ho sakta hai! 😌💖";
          break;
        case 5:
          result = "50-50 chance hai! 🤔 Kismat pe chhod do!";
          break;
        case 4:
          result =
              "Yeh rishta thoda weak lagta hai 💔 Soch samajh ke aage badho!";
          break;
        case 3:
          result = "Hmmm... Kuch khaas vibe nahi aayi 😅";
          break;
        case 2:
          result =
              "Is connection mein buffering zyada hai 🐢 Try karne mein kya jaata hai?";
          break;
        case 1:
          result = "Bas mil lo, friend zone ready hai 😬";
          break;
        default:
          result =
              "Bhai better luck next time 🤡 Yeh toh niraasha hi niraasha hai!";
      }

      // ✅ Your own logic starts here
      // int asciiSum =
      //     name1.codeUnits.fold(0, (sum, c) => sum + c) +
      //     name2.codeUnits.fold(0, (sum, c) => sum + c);
      // int combinedLength = name1.length + name2.length;
      // final seed = asciiSum + combinedLength;
      // final rng = Random(seed);
      // int rawPercent = rng.nextInt(100) + 1;
      // String formattedPercentage = '$rawPercent%';

      // // String result;
      // if (rawPercent > 95) {
      //   result = "A match made in heaven! ❤️";
      // } else if (rawPercent > 90) {
      //   result = "There's potential! 💞";
      // } else if (rawPercent > 80) {
      //   result = "There's potential! 💞";
      // } else if (rawPercent > 70) {
      //   result = "There's potential! 💞";
      // } else if (rawPercent > 60) {
      //   result = "There's potential! 💞";
      // } else if (rawPercent > 50) {
      //   result = "There's potential! 💞";
      // } else if (rawPercent > 40) {
      //   result = "Could work with effort. 💔";
      // } else if (rawPercent > 30) {
      //   result = "Could work with effort. 💔";
      // } else if (rawPercent > 20) {
      //   result = "Could work with effort. 💔";
      // } else if (rawPercent > 10) {
      //   result = "Could work with effort. 💔";
      // } else {
      //   result = "Better luck next time 😅";
      // }

      // ✅ Navigate to FinalPage with values
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FinalPage(
            name1: name1,
            name2: name2,
            percentage: formattedPercentage,
            result: result,
          ),
        ),
      );
    } catch (e) {
      Navigator.pop(context); // ✅ Close loader on error
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error fetching result: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextfilled(
                      controller: firstNameController,
                      texthint: "Male",
                      profile: Icon(
                        Icons.male,
                        color: Colors.blue,
                        size: screenWidth * 0.06,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    MyTextfilled(
                      controller: secondNameController,
                      texthint: "Female",
                      profile: Icon(
                        Icons.female,
                        color: Colors.pink,
                        size: screenWidth * 0.06,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    ElevatedButton(
                      onPressed: _calculateLove,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(206, 19, 56, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenHeight * 0.04,
                        ),
                      ),
                      child: Text(
                        "Calculate",
                        style: GoogleFonts.roboto(
                          letterSpacing: 3,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
