import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_utils.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;
  const PasswordStrengthIndicator({required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    final strength = AuthUtils.evaluatePassword(password);
    final label = AuthUtils.strengthLabel(strength);
    Color color;
    double value;
    switch (strength) {
      case PasswordStrength.strong:
        color = const Color.fromARGB(255, 0, 255, 8);
        value = 1;
        break;
      case PasswordStrength.medium:
        color = Colors.orange;
        value = 0.5;
        break;
      default:
        color = const Color.fromARGB(255, 255, 17, 0);
        value = 0.3;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 4,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
