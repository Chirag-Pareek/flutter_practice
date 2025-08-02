import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Pages/login_page.dart';
import 'package:login_page/Pages/navigatepage.dart';
import 'package:login_page/widgets/widget_tree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const WidgetTree(),
      routes: {
        '/google': (context) => const Signup(provider: "google"),
        '/github': (context) => const Signup(provider: "github"),
        '/apple': (context) => const Signup(provider: "apple"),
        '/loginpage': (context) => const LoginPage(),
      },
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
