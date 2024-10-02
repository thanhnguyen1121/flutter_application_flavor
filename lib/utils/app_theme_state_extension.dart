import 'package:build_flavor/themes.dart';
import 'package:flutter/material.dart';

extension AppThemeStateExtension on BuildContext {
  AppTheme get appTheme {
    return Theme.of(this).extension<AppTheme>()!;
  }
}
