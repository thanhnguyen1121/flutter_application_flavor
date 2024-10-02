import 'package:auth_nav/auth_nav.dart';
import 'package:build_flavor/ui/blocs/auth/auth_bloc.dart';
import 'package:build_flavor/ui/pages/authentication/authentication_navigator.dart';
import 'package:build_flavor/ui/pages/main/main_navigator.dart';
import 'package:build_flavor/ui/pages/splash/app_splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/local/local_service.dart';
import 'generated/l10n.dart';
import 'themes.dart';

final GlobalKey appKey = GlobalKey();

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light(context),
      darkTheme: dark(context),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: Scaffold(
        key: appKey,
        body: AuthNavigation(
          //Flow after user login success this page need user NavigatorSupport
          authorizedBuilder: (context) => const MainNavigator(),

          //Flow after user login success
          splashScreen: AppSplashPage((context) async {
            if (GetIt.instance.get<LocalService>().isAuthorized()) {
              await GetIt.instance.get<AuthBloc>().initializeApp();
              return AuthNavigationState.authorized();
            } else {
              return AuthNavigationState.unAuthorized();
            }
          }),

          //Flow user login success this page need user NavigatorSupport
          unAuthorizedBuilder: (context) => const AuthenticationNavigator(),

          //Customize if application is have this feature!!
          maintenanceBuilder: (context) => Container(
            alignment: Alignment.center,
            child: const Text("Maintenance page"),
          ),

          guestBuilder: (context) => Container(
            alignment: Alignment.center,
            child: const Text("Guest page"),
          ),
        ),
      ),
    );
  }
}
