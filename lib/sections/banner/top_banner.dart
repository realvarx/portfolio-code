import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_web/sections/banner/animated_text.dart';
import 'package:personal_web/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class TopBanner extends StatelessWidget {
  final AutoScrollController? controller;

  const TopBanner({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return AspectRatio(
          aspectRatio:
              sizingInformation.deviceScreenType == DeviceScreenType.mobile
                  ? 2.5
                  : 3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/images/blur2.jpg",
                fit: BoxFit.cover,
              ),
              Container(
                color: backColor.withOpacity(0.75),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText("Hello, I'm Álvaro Merino",
                              textStyle: sizingInformation.deviceScreenType ==
                                      DeviceScreenType.desktop
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      )
                                  : Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                              speed: Duration(milliseconds: 100))
                        ]),
                    SizedBox(height: defaultPadding),
                    BuildAnimatedText(texts: {
                      "Responsive portfolio website": "flutter",
                      "QR & Barcode Scanner App": "flutter",
                      "RFC2453 : RIPv2 protocol daemon": "C",
                      "RFC868 : Time protocol client": "C",
                      "Classroom engagement App prototype": "flutter"
                    }),
                    SizedBox(height: defaultPadding),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _scrollToIndex(
                                  1,
                                  sizingInformation.deviceScreenType !=
                                          DeviceScreenType.desktop
                                      ? AutoScrollPosition.begin
                                      : AutoScrollPosition.middle);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(15.0),
                              backgroundColor: primaryColor,
                            ),
                            child: Text(
                              "VIEW MY WORK",
                              style: TextStyle(color: backColor),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              _scrollToIndex(2, AutoScrollPosition.end);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(15.0),
                              backgroundColor: primaryColor,
                            ),
                            child: Text(
                              "CONTACT",
                              style: TextStyle(color: backColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future _scrollToIndex(int index, AutoScrollPosition position) async {
    await controller!.scrollToIndex(index,
        preferPosition: position, duration: Duration(milliseconds: 500));
  }
}
