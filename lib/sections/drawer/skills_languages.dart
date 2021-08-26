import 'package:flutter/material.dart';
import 'package:personal_web/sections/drawer/knowledges.dart';
import 'package:personal_web/sections/drawer/languages.dart';
import 'package:personal_web/sections/drawer/programming.dart';
import 'package:personal_web/values.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Center(
          child: Text.rich(TextSpan(
              text: "Skills",
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
              children: [
                TextSpan(
                    text: " & ",
                    style: TextStyle(color: primaryColor),
                    children: [
                      TextSpan(
                          text: "languages", style: TextStyle(color: textColor))
                    ])
              ])),
        ),
        //SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Programming(),
              Knowledges(),
              Languages(),
            ],
          ),
        ),
      ],
    );
  }
}
