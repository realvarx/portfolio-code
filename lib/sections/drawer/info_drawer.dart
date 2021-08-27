import 'package:flutter/material.dart';

import 'personal_info.dart';
import 'skills_languages.dart';

class InfoDrawer extends StatelessWidget {
  const InfoDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ScrollController _scrollController = ScrollController();

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            PersonalInfo(),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Skills(),
                      Divider(
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "© 2021 - Álvaro Merino Argumánez",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
