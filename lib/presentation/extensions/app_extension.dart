import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

extension AppExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  AppTextStyles get textStyles => AppTextStyles();
}
