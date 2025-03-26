import 'package:flutter/material.dart';

abstract class RouteNavigationHelper {
  static PageRouteBuilder<dynamic> buildPageRoute(
      Widget page, PageTransitionType transitionType) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case PageTransitionType.fade:
            return FadeTransition(opacity: animation, child: child);
          case PageTransitionType.slideFromRight:
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );
          case PageTransitionType.slideFromLeft:
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(-1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );
          case PageTransitionType.upFade:
            return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: animation.drive(
                    Tween(begin: const Offset(0, 1), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.easeInOut)),
                  ),
                  child: child,
                ));
          default:
            return child; // No animation
        }
      },
    );
  }
}

enum PageTransitionType {
  fade,
  slideFromRight,
  slideFromLeft,
  upFade,
}
