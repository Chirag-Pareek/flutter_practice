import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Classes/logobutton.dart';
import 'package:login_page/Classes/mybutton.dart';
import 'package:login_page/Classes/mytext_field.dart';
import 'package:login_page/Pages/forgot_password.dart';
import 'package:login_page/Pages/home_page.dart';
import 'package:login_page/Pages/signup_page.dart%20';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final username = TextEditingController();
  final password = TextEditingController();
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.setLanguageCode('en');
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
      body:
          isloading // 2. Show loading if true
          ? loadingWidget()
          : LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Container(
                      width: screenWidth.isInfinite
                          ? double.infinity
                          : screenWidth,
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
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              // ignore: deprecated_member_use
                                              color: Colors.grey.withOpacity(
                                                0.2,
                                              ),
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
                                          color: const Color.fromARGB(
                                            255,
                                            0,
                                            0,
                                            0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ), //// this is only login icon container
                                      Text(
                                        'Sign In With Email',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.001),
                                      Text(
                                        'If you already have an account, please login with your email and password. If not “Sign up” text is clickable',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                            120,
                                            0,
                                            0,
                                            0,
                                          ),
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
                                        suffixIcon: Icons.visibility_off,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton(
                                          style: ButtonStyle(
                                            overlayColor:
                                                WidgetStateProperty.all(
                                                  Colors.transparent,
                                                ),
                                            foregroundColor:
                                                WidgetStateProperty.resolveWith<
                                                  Color
                                                >((Set<WidgetState> states) {
                                                  if (states.contains(
                                                    WidgetState.pressed,
                                                  )) {
                                                    return const Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0,
                                                    );
                                                  }
                                                  return const Color.fromRGBO(
                                                    0,
                                                    0,
                                                    0,
                                                    0.625,
                                                  );
                                                }),
                                          ),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                          top: Radius.circular(
                                                            16,
                                                          ),
                                                        ),
                                                  ),
                                              builder: (_) => Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(
                                                    context,
                                                  ).viewInsets.bottom,
                                                  left: 16,
                                                  right: 16,
                                                  top: 16,
                                                ),
                                                child: const ForgotPassword(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Forgot password?',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Mybutton2(
                                        text: 'Login',
                                        onPressed: () async {
                                          try {
                                            await auth
                                                .signInWithEmailAndPassword(
                                                  email: username.text
                                                      .toLowerCase()
                                                      .trim(),
                                                  password: password.text
                                                      .trim(),
                                                );
                                            if (!mounted) return;
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushAndRemoveUntil(
                                              // ignore: use_build_context_synchronously
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return const HomePage();
                                                },
                                              ),
                                              (route) => false,
                                            );
                                          } catch (e) {
                                            // Handle login error
                                            //ignore: avoid_print
                                            print('Login failed: $e');
                                            ScaffoldMessenger.of(
                                              // ignore: use_build_context_synchronously
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text("Login Failed"),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.02,
                                              ),
                                              height: screenHeight * 0.001,
                                              color: Colors.black,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SignupPage(),
                                              ),
                                            ),
                                            child: Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: const Color.fromARGB(
                                                  255,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.02,
                                              ),
                                              height: screenHeight * 0.001,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: screenHeight * 0.02),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Logobutton(
                                              imagePath:
                                                  'assets/logo/google-logo.png',
                                              pagePath: '/google',
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.02),
                                          Expanded(
                                            child: Logobutton(
                                              imagePath:
                                                  'assets/logo/github-logo.png',
                                              pagePath: '/github',
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.02),
                                          Expanded(
                                            child: Logobutton(
                                              imagePath:
                                                  'assets/logo/apple-logo.png',
                                              pagePath: '/apple',
                                            ),
                                          ),
                                        ],
                                      ),
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
