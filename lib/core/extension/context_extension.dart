import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<Object?> pushNamed({required String name, dynamic arguments}) {
    return Navigator.of(this).pushNamed(name, arguments: arguments);
  }

  Future<Object?> pushNamedRemovedIntell({required String name}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(name, (route) => false);
  }

  Future<Object?> pushNamedReplacment({required String name}) {
    return Navigator.of(this).pushReplacementNamed(name);
  }

  void pop() {
    Navigator.of(this).pop();
  }

  ThemeData getTheme() {
    return Theme.of(this);
  }

  double getScreenWidth() {
    return MediaQuery.sizeOf(this).width;
  }

  double getScreenHeight() {
    return MediaQuery.sizeOf(this).height;
  }
}
