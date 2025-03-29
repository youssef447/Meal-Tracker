import 'package:flutter/material.dart';

abstract class AppColors {
  //constants
  static const primary = Color(0Xff37c0fe);
  static const List<Color> button = [Color(0Xff37c0fe), Color(0Xff0be7fe)];
  static const lightGrey = Color.fromARGB(255, 241, 238, 238);
  //theme based
  static Color background(context) => Theme.of(context).scaffoldBackgroundColor;

  static Color inverse(context) => Theme.of(context).colorScheme.onSurface;
}
