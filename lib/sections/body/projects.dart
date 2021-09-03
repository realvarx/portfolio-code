import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_web/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../data.dart';
import '../../values.dart';

class Projects extends StatelessWidget {
  final AutoScrollController? controller;

  const Projects({Key? key, this.controller}) : super(key: key);

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
                            text: "PRO",
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
                            children: [
                          TextSpan(
                            text: "JECTS",
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
                          )
                        ])))),
                SizedBox(height: 20.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop
                          ? 3
                          : sizingInformation.deviceScreenType ==
                                  DeviceScreenType.mobile
                              ? 1
                              : 2),
                  itemBuilder: (context, index) {
                    return ProjectTile(
                      project: projects[index],
                      sizingInformation: sizingInformation,
                      onPressed: () {
                        launchURL(projects[index].url!);
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }
}

class ProjectTile extends StatelessWidget {

  final Project project;
  final SizingInformation sizingInformation;
  final VoidCallback onPressed;

  const ProjectTile(
      {Key? key, required this.project, required this.sizingInformation, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: backColor.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    width: 1.5,
                    color: backColor.withOpacity(0.6),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridTile(
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(project.iconData,
                          size: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop
                              ? 24.0
                              : 14.0),
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: Text(
                          project.name!,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  //fontWeight: FontWeight.bold,
                                  fontSize:
                                      sizingInformation.deviceScreenType ==
                                              DeviceScreenType.mobile
                                          ? 13.0
                                          : 13.0),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(project.iconData,
                          size: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop
                              ? 24.0
                              : 14.0),
                    ],
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 42.0),
                    child: Text(
                      project.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: textColor.withOpacity(0.55)),
                    ),
                  )),
                  footer: GridTileBar(
                    title: Text(
                      project.state!,
                      style: TextStyle(color: project.stateColor),
                    ),
                    trailing: TextButton(
                      onPressed: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "SHOW MORE",
                          style: TextStyle(color: backColor),
                        ),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: primaryColor),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
