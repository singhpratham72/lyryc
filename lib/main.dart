import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lyryc_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lyryc App',
      theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.black,
          fontFamily: GoogleFonts.nunito().fontFamily),
      home: HomeScreen(),
    );
  }
}
