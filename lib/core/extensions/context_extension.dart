import 'package:flutter/Material.dart';

extension ContextExtension on BuildContext {
  navigate(String route, {Object? arguments}) {
    Navigator.of(this).pushNamed(
      route,
      arguments: arguments,
    );
  }

  navigateTo(String route, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  pop() {
    Navigator.of(this).pop();
  }
}
