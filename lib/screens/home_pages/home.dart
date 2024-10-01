import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrail_fp/screens/home_pages/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: const AppNavigation(),
    );
  }
}
