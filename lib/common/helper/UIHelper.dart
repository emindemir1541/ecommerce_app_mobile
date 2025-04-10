import 'package:flutter/material.dart';

extension UIHelper on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
