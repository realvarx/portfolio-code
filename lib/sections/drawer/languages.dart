import 'package:flutter/material.dart';

import '../../values.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 10,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading:
              Icon(Icons.translate_outlined, size: 20.0, color: primaryColor),
          title: Text(
            "SPOKEN LANGUAGES",
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                color: textColor,
                fontSize: 13.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 10.0,
          leading: Icon(Icons.chevron_right_outlined),
          title: Text.rich(TextSpan(
              text: "Native",
              style: TextStyle(color: textColor),
              children: [
                TextSpan(
                    text: " spanish ",
                    style: TextStyle(color: primaryColor),
                    children: [
                      TextSpan(
                        text: "speaker",
                        style: TextStyle(color: textColor),
                      ),
                    ])
              ])),
        ),
        ListTile(
          minLeadingWidth: 10.0,
          leading: Icon(Icons.chevron_right_outlined),
          title: Text.rich(TextSpan(
              text: "C1",
              style: TextStyle(color: textColor),
              children: [
                TextSpan(
                    text: " english ",
                    style: TextStyle(color: primaryColor),
                    children: [
                      TextSpan(
                        text: "(Cambridge Certified)",
                        style: TextStyle(color: textColor),
                      ),
                    ])
              ])),
        )
      ],
    );
  }
}
