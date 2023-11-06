class Routes {
  static const homeRouter = 'HOME_ROUTER';
  static const layOut = 'LAYOUT_ROUTER';
  static const videoPlayerRouter = 'VIDEO_PLAYER_ROUTER';
  static const mapRouter = 'Map_ROUTER';
}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
