import 'package:build_flavor/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';

ThemeData light(BuildContext context) {
  return ThemeData.light().copyWith(
    extensions: <AppThemeExtension<dynamic>>[
      AppTheme(),
    ],
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }),
  );
}

ThemeData dark(BuildContext context) {
  return ThemeData.dark().copyWith(
    extensions: <AppThemeExtension<dynamic>>[
      AppTheme(),
    ],
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }),
  );
}

class AppTheme extends AppThemeExtension<AppTheme> {}
