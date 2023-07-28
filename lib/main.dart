// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:futter_catalog/pages/home_page.dart';
import 'package:futter_catalog/pages/login_page.dart';
import 'package:futter_catalog/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primaryTextTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      ),
      routes: {
        MyRoutes.LoginPageRoute: (context) => const HomePage(),
        MyRoutes.HomePageRoute: (context) => const LoginPage(),
        MyRoutes.HomePageRoute: (context) => const LoginPage(),
      },
    );
  }
}
