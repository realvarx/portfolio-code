import 'dart:ui';

import 'package:flutter/material.dart';

class Project {

  final String? name;
  final String? description;
  final String? state;
  final Color? stateColor;
  final IconData? iconData;
  final String? url;

  Project(this.name, this.description, this.state, this.stateColor, this.iconData, this.url);
}

List<Project> projects = [

  Project(
    "QR & Barcode Scanner App", 
    "The app integrated scanner is able to identify various types of barcodes " + 
    "and display its information to the user thanks to the Google Machine Learning Kit. " +
    "It also contains a history with all the previously scanned elements and provides the posibility of " + 
    "creating customised lists with those elements.", 
    "Released Alpha", Colors.amber, Icons.qr_code_scanner_outlined,
    "https://play.google.com/store/apps/details?id=com.realvarx.totalscanner"
  ),

  Project("Classroom engagement App", 
    "Similar to 'Kahoot!' or 'Wooclap'. " + 
    "UI and log-in specially designed for UC3M student mail system. ", 
    "On production", Colors.yellow, Icons.school_outlined,
    "https://realvarx.github.io/classroom-engagement-info/"
  ),

  Project(
    "Responsive portfolio website", 
    "This beautiful responsive website! I designed it to practice and acquire new Flutter Web knowledge. ", 
    "Finished", Colors.green, Icons.public_outlined,
    "https://realvarx.github.io/portfolio/"
  )
  // Project("Demo Firebase Login", "", "Finished", Colors.green, Icons.science_outlined),
];