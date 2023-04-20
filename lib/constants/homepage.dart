import 'dart:ffi';

import 'package:flutter/material.dart';

TextStyle kHomeTextStyle = const TextStyle(
fontSize:35,
fontWeight: FontWeight.w900,
);

ButtonStyle kHomeButtonStyle =  ButtonStyle(
  backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple[300]!),

);

Color? primaryColor = Colors.deepPurple[300];

Color? secondaryColor = Colors.black;
Color? greyBackground = Color.fromARGB(255, 229, 229, 229);