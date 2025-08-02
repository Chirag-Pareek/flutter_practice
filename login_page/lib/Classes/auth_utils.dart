enum PasswordStrength { weak, medium, strong }

class AuthUtils {
  // domain restriction
  static bool isAllowedEmailDomain(String email) {
    final lower = email.toLowerCase().trim();
    return lower.endsWith('@gmail.com') || lower.endsWith('@icloud.com');
  }

  // evaluate password strength
  static PasswordStrength evaluatePassword(String password) {
    int score = 0;
    if (password.length >= 6) score += 1;
    if (RegExp(r'[A-Z]').hasMatch(password)) score += 1;
    if (RegExp(r'[a-z]').hasMatch(password)) score += 1;
    if (RegExp(r'\d').hasMatch(password)) score += 1;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score += 1;

    if (score >= 5) return PasswordStrength.strong;
    if (score >= 3) return PasswordStrength.medium;
    return PasswordStrength.weak;
  }

  static String strengthLabel(PasswordStrength s) {
    switch (s) {
      case PasswordStrength.strong:
        return 'Strong';
      case PasswordStrength.medium:
        return 'Medium';
      case PasswordStrength.weak:
        return 'Weak';
    }
  }
}
