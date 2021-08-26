import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_web/home_page.dart';
import 'package:personal_web/values.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backColor,
        canvasColor: backColor,
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyText1: TextStyle(color: textColor),
              bodyText2: TextStyle(color: textColor),
            ),
      ),
      home: HomePage()
    );
  }
}