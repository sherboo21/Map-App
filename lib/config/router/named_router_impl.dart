import 'package:flutter/material.dart';
import '../../utils/app_imports.dart';


class NamedNavigatorImpl implements NamedNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRouter:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.layOut:
        return MaterialPageRoute(builder: (_) => const LayOutScreen());
      case Routes.videoPlayerRouter:
        return MaterialPageRoute(builder: (_) => const VideoPlayerScreen());
      case Routes.mapRouter:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      }
    return MaterialPageRoute(builder: (_) => const SizedBox());
  }

  @override
  void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  @override
  Future push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    }

    if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }

    return navigatorState.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}
