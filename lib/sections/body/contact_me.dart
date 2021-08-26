import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../values.dart';
import '../../utils.dart';

class ContactMe extends StatelessWidget {
  final AutoScrollController? controller;

  const ContactMe({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                // Divider(color: backColor),
                Container(
                    height: 90.0,
                    // color: backColor,
                    child: Center(
                        child: Text.rich(TextSpan(
                            text: "CONT",
                            style: sizingInformation.deviceScreenType ==
                                    DeviceScreenType.mobile
                                ? Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2)
                                : Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                            children: [
                          TextSpan(
                            text: "ACT",
                            style: sizingInformation.deviceScreenType ==
                                    DeviceScreenType.mobile
                                ? Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2)
                                : Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                          )
                        ])))),
                SizedBox(height: 100.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => launchURL("https://github.com/realvarx"),
                      child: FaIcon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                    //SizedBox(width: 90.0),
                    InkWell(
                      onTap: () => launchURL("https://www.linkedin.com/in/alvaromerarg/"),
                      child: FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                    //SizedBox(width: 90.0),
                    InkWell(
                      onTap: () => launchURL("mailto:<alvaromerarg@gmail.com>?subject=<subject>&body=<body>"),
                      child: FaIcon(
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100.0),
              ],
            )
          ],
        ),
      );
    });
  }
}
