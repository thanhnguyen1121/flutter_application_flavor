import 'package:build_flavor/ui/pages/home/home_page.dart';
import 'package:build_flavor/utils/navigator_support.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: 'home',
      onGenerateRoute: (setting) {
        return MaterialPageRoute(builder: (context) => const HomePage());
      },
    );
  }
}
