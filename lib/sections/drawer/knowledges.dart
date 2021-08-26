import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../values.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 10,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading:
              Icon(Icons.emoji_objects_outlined, size: 20.0, color: primaryColor),
          title: Text(
            "KNOWLEDGES",
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                color: textColor,
                fontSize: 13.0),
          ),
        ),
        KnowledgeText(text: "Firebase"),
        KnowledgeText(text: "Networks \n(RFCs, routing, security...)"),
        KnowledgeText(text: "Linux"),
        KnowledgeText(text: "Git")
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {

  final String text;

  const KnowledgeText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Row(
        children: [
          Icon(Icons.chevron_right_outlined),
          SizedBox(width: 11.0),
          Text(
            text,
            overflow: TextOverflow.clip,
            maxLines: 2, 
            style: Theme.of(context).textTheme.subtitle2)
        ],
      ),
    );
  }
}
