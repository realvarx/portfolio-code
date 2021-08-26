import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:personal_web/sections/banner/top_banner.dart';
import 'package:personal_web/sections/body/contact_me.dart';
import 'package:personal_web/sections/body/projects.dart';
import 'package:personal_web/sections/drawer/info_drawer.dart';
import 'package:personal_web/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const maxCount = 100;
  final random = math.Random();
  final scrollDirection = Axis.vertical;

  late AutoScrollController controller;
  late List<List<int>> randomList;

  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    randomList = List.generate(maxCount,
        (index) => <int>[index, (1000 * random.nextDouble()).toInt()]);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
            backgroundColor: secondaryColor,
            appBar: sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop
                ? null
                : AppBar(
                    backgroundColor: backColor,
                    leadingWidth: 150,
                    leading: Builder(
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.menu, color: backColor, size: 20.0),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "ABOUT ME",
                                  style: TextStyle(
                                      color: backColor, fontSize: 10.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            drawer: InfoDrawer(),
            // floatingActionButton: ,
            body: AnimatedBackground(
              behaviour: RacingLinesBehaviour(direction: LineDirection.Ttb),
              vsync: this,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop)
                        Expanded(
                          flex: 2,
                          child: InfoDrawer(),
                        ),
                      Expanded(
                        flex: 7,
                        child: SingleChildScrollView(
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                AutoScrollTag(
                                    key: ValueKey(0),
                                    index: 0,
                                    controller: controller,
                                    child: TopBanner(controller: controller)),
                                AutoScrollTag(
                                    key: ValueKey(1),
                                    index: 1,
                                    controller: controller,
                                    child: Projects(controller: controller)),
                                AutoScrollTag(
                                    key: ValueKey(2),
                                    index: 2,
                                    controller: controller,
                                    child: ContactMe(controller: controller)),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     _scrollToIndex(0);
                                //   },
                                //   style: TextButton.styleFrom(
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: defaultPadding * 2,
                                //         vertical: defaultPadding),
                                //     backgroundColor: primaryColor,
                                //   ),
                                //   child: Text(
                                //     "TEST AUTO SCROLL",
                                //     style: TextStyle(color: backColor),
                                //   ),
                                // ),
                                // Projects(),
                                // ContactMe()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
  // Future _scrollToIndex(int index) async {
  //   await controller.scrollToIndex(index,
  //       preferPosition: AutoScrollPosition.middle);
  // }
}
