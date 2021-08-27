import 'package:flutter/material.dart';

import '../../values.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: secondaryColor,
      child: Column(
        children: [
          //Spacer(flex: 2,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            color: backColor,
            child: Text.rich(TextSpan(
                text: "About ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                children: [
                  TextSpan(
                      text: "me",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0))
                ])),
          ),

          ListTile(
            leading: Icon(Icons.perm_identity_outlined, color: primaryColor),
            title: Text("Álvaro Merino Argumánez"),
          ),
          ListTile(
            leading: Icon(Icons.school_outlined, color: primaryColor),
            title: Text("Telematics Engineering student @UC3M"),
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined, color: primaryColor),
            title: Text("Madrid, Spain"),
          ),
          Divider(
            indent: 20.0,
            endIndent: 20.0,
          ),
        ],
      ),
    );
  }
}
