import 'dart:ui';

import 'package:flutter/material.dart';

class Project {

  final String? name;
  final String? description;
  final String? state;
  final Color? stateColor;
  final IconData? iconData;

  Project(this.name, this.description, this.state, this.stateColor, this.iconData);
}

List<Project> projects = [

  Project(
    "QR & Barcode Scanner App", 
    "The app integrated scanner is able to identify various types of barcodes " + 
    "and display its information to the user thanks to the Google Machine Learning Kit. " +
    "It also contains a history with all the previously scanned elements and provides the posibility of " + 
    "creating customised lists with those elements.", 
    "Pre-release", Colors.amber, Icons.qr_code_scanner_outlined
  ),

  Project("Classroom engagement App", 
    "Similar to 'Kahoot!' or 'Wooclap'. " + 
    "UI and log-in specially designed for UC3M student mail system. ", 
    "On production", Colors.yellow, Icons.school_outlined
  ),

  Project("Responsive portfolio website", 
  "This beautiful responsive website! I designed it to practice and acquire new Flutter Web knowledge. ", 
  "Finished", Colors.green, Icons.public_outlined),
  // Project("Demo Firebase Login", "", "Finished", Colors.green, Icons.science_outlined),
];