import 'package:build_flavor/utils/navigator_support.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class AuthenticationNavigator extends StatefulWidget {
  const AuthenticationNavigator({super.key});

  @override
  State<AuthenticationNavigator> createState() => _AuthenticationNavigatorState();
}

class _AuthenticationNavigatorState extends State<AuthenticationNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: 'login',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const SignInPage());
      },
    );
  }
}
