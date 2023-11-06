String svgIconsName(String? image) {
  return 'assets/icons/$image.svg';
}
String jpgIconsName(String? image) {
  return 'assets/icons/$image.jpg';
}
class AppIcons {
  static String get egyptIcon => svgIconsName('egypt');
  static String get chatIcon => svgIconsName('chat');
  static String get icon => jpgIconsName('icon');
}
