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
      double iconSize =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? 100.0
              : 50.0;
      double boxSize =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? 100.0
              : 50.0;

      List<Widget> contactList = [
        ContactButton(
            iconData: FontAwesomeIcons.github,
            url: "https://github.com/realvarx",
            tag: "@realvarx",
            iconSize: iconSize,
            sizingInformation: sizingInformation),
        if (sizingInformation.deviceScreenType != DeviceScreenType.desktop)
          SizedBox(height: 30.0),
        ContactButton(
            iconData: FontAwesomeIcons.linkedin,
            url: "https://www.linkedin.com/in/alvaromerarg/",
            tag: "alvaromerarg",
            iconSize: iconSize,
            sizingInformation: sizingInformation),
        if (sizingInformation.deviceScreenType != DeviceScreenType.desktop)
          SizedBox(height: 30.0),
        ContactButton(
            iconData: Icons.email_outlined,
            url: "mailto:<alvaromerarg@gmail.com>",
            tag: "alvaromerarg@gmail.com",
            iconSize: iconSize,
            sizingInformation: sizingInformation),
      ];

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
                SizedBox(height: boxSize),
                sizingInformation.deviceScreenType == DeviceScreenType.desktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: contactList)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: contactList),
                SizedBox(height: boxSize),
              ],
            )
          ],
        ),
      );
    });
  }
}

class ContactButton extends StatelessWidget {
  final IconData iconData;
  final String url;
  final String tag;
  final double iconSize;
  final SizingInformation sizingInformation;

  const ContactButton(
      {Key? key,
      required this.iconData,
      required this.url,
      required this.tag,
      required this.iconSize,
      required this.sizingInformation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => launchURL(url),
        child: sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    iconData,
                    color: Colors.white,
                    size: iconSize,
                  ),
                  Text(tag),
                ],
              )
            : ListTile(
                leading: FaIcon(
                  iconData,
                  color: Colors.white,
                  size: iconSize,
                ),
                title: Center(child: Text(tag)),
              ));
  }
}

// Container(
//               padding: EdgeInsets.symmetric(horizontal: 30.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     FaIcon(
//                       iconData,
//                       color: Colors.white,
//                       size: iconSize,
//                     ),
//                     SizedBox(width: 30.0),
//                     Text(tag),
//                   ],
//                 ),
//             )
