import 'package:flutter/material.dart';

abstract class AppContext {
  static final GlobalKey<NavigatorState> appNavKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get getContext => appNavKey.currentContext;
}
