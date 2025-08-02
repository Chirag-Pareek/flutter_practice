import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Classes/mybutton.dart';
import 'package:login_page/Classes/mytext_field.dart';
import 'package:login_page/Pages/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_page/Classes/Real_Time_Strenght_Indicator.dart';
import 'package:login_page/Classes/auth_utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // clean up to avoid memory leaks
    username.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar:
      //     true, // allow background to extend behind the app bar
      // appBar: AppBar(
      //   title: Text('Login Page'),
      //   titleTextStyle: TextStyle(
      //     fontSize: 24,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.black,
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                width: screenWidth.isInfinite ? double.infinity : screenWidth,
                height: screenHeight.isInfinite
                    ? double.infinity
                    : screenHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFE4F1FB), // Light blue top
                      Colors.white,
                    ],
                  ),
                ),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Align(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: screenHeight * 0.6,
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFE4F1FB), // Light blue top
                                Colors.white, // White bottom
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                  0,
                                  0,
                                ), // changes position of shadow
                                blurStyle: BlurStyle
                                    .solid, // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenWidth * 0.11,
                                  height: screenHeight * 0.05,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        // ignore: deprecated_member_use
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 2,
                                        offset: const Offset(0, 2),
                                        blurStyle: BlurStyle
                                            .solid, // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.login,
                                    size: 25,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ), //// this is only login icon container
                                Text(
                                  'Sign Up With Email',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.001),
                                Text(
                                  'Create your account with unique username and password',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(120, 0, 0, 0),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                MyTextField(
                                  hintText: 'Email',
                                  icon: Icons.mail,
                                  controller: username,
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                MyTextField(
                                  hintText: 'Password',
                                  icon: Icons.lock,
                                  controller: password,
                                  isPassword: true,
                                ),
                                SizedBox(height: 6),
                                // live password strength
                                PasswordStrengthIndicator(
                                  password: password.text,
                                ),

                                SizedBox(height: screenHeight * 0.02),
                                MyTextField(
                                  hintText: 'Confirm Password',
                                  icon: Icons.lock,
                                  controller: confirmPassword,
                                  isPassword: true,
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                Mybutton2(
                                  text: 'Sign Up',

                                  onPressed: () async {
                                    if (!AuthUtils.isAllowedEmailDomain(
                                      username.text,
                                    )) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Email must be @gmail.com or @icloud.com',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    if (password.text != confirmPassword.text) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Password Didn't matched",
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    if (password.text.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please Enter Password',
                                          ),
                                          backgroundColor: Color.fromARGB(190, 255, 17, 0),
                                        ),
                                      );

                                      return;
                                    }
                                    final strength = AuthUtils.evaluatePassword(
                                      password.text,
                                    );
                                    if (strength == PasswordStrength.weak) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Password too weak. Use atleast 6 chars with upper/lower, number, special char.',
                                          ),
                                          backgroundColor: Color.fromARGB(
                                            255,
                                            255,
                                            17,
                                            0,
                                          ),
                                        ),
                                      );

                                      return;
                                    }

                                    setState(() => isLoading = true);

                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                            email: username.text
                                                .toLowerCase()
                                                .trim(),
                                            password: password.text.trim(),
                                          );

                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(
                                        // ignore: use_build_context_synchronously
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Account created successfully!',
                                          ),
                                          backgroundColor: const Color.fromARGB(
                                            255,
                                            9,
                                            177,
                                            15,
                                          ),
                                        ),
                                      );
                                      Navigator.pushAndRemoveUntil(
                                        // ignore: use_build_context_synchronously
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                        (route) => false,
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      String message;
                                      switch (e.code) {
                                        case 'weak-password':
                                          message = 'The password is too weak.';
                                          break;
                                        case 'email-already-in-use':
                                          message = 'Email already registered.';
                                          break;
                                        case 'invalid-email':
                                          message = 'Invalid email.';
                                          break;
                                        default:
                                          message =
                                              e.message ?? 'Sign-up failed.';
                                      }
                                      ScaffoldMessenger.of(
                                        // ignore: use_build_context_synchronously
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(message),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        // ignore: use_build_context_synchronously
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Sign-Up failed: ${e.toString()}',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } finally {
                                      if (mounted) {
                                        setState(() => isLoading = false);
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: SpinKitFadingCircle(
        size: 50.0,
        // color will use default; you can specify if you want
      ),
    );
  }
}
