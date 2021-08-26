import 'package:flutter/material.dart';

import '../../values.dart';
import 'animated_progress_indicator.dart';

class Programming extends StatelessWidget {
  const Programming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 10,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: Icon(Icons.code_outlined, size: 20.0, color: primaryColor),
          title: Text(
            "PROGRAMMING",
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                color: textColor,
                fontSize: 13.0),
          ),
        ),
        SizedBox(height: 20.0),
        AnimatedLinearProgressIndicator(
          percentage: 0.65,
          label: "Dart & Flutter",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.6,
          label: "Java",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.5,
          label: "C",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.4,
          label: "Python",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.33,
          label: "MATLAB / R",
        ),
      ],
    );
  }
}
