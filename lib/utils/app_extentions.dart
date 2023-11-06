import 'package:flutter/material.dart';

/// App SizedBox Extension ///

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

/// App Padding Extension ///

extension CustomPadding on Widget {
  // padding all //
  addAllPadding(double val) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );

  // padding symmetric //
  addSymmetricPadding({double? hVal, double? vVal}) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: hVal ?? 0, vertical: vVal ?? 0),
        child: this,
      );

  // padding only //
  addOnlyPadding({double? tVal, double? bVal, double? lVal, double? rVal}) =>
      Padding(
        padding: EdgeInsets.only(
            top: tVal ?? 0,
            bottom: bVal ?? 0,
            left: lVal ?? 0,
            right: rVal ?? 0),
        child: this,
      );
}

/// app navigate Extension ///
extension CustomNavigator on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushReplacement(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  void pop() async {
    return Navigator.pop(this);
  }
}