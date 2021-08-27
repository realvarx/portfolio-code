import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../values.dart';

class BuildAnimatedText extends StatelessWidget {
  final Map<String, String> texts;

  const BuildAnimatedText({Key? key, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return DefaultTextStyle(
            style: Theme.of(context).textTheme.subtitle1!,
            maxLines: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts:
                      animatedTexts(texts, sizingInformation, context),
                )
              ],
            ));
      },
    );
  }

  List<AnimatedText> animatedTexts(Map<String, String> texts,
      SizingInformation sizingInformation, BuildContext context) {
    List<AnimatedText> output = [];

    texts.forEach((key, value) {
      output.add(TypewriterAnimatedText(
        "<" + value + "> " + key + " </" + value + ">",
        speed: Duration(milliseconds: 65),
        textStyle:
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    )
                : Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: 10.0
                    ),
      ));
    });

    return output;
  }
}
