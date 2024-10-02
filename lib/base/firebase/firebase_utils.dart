import 'dart:developer';

import 'package:build_flavor/dev_firebase_options.dart' as firebase_dev;
import 'package:build_flavor/env.dart';
import 'package:build_flavor/prod_firebase_options.dart' as firebase_prod;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseUtils {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> init() async {
    String flavor = const String.fromEnvironment('FLAVOR');
    late FirebaseOptions firebaseOptions;
    late String name;
    if (flavor == '' || flavor == Flavor.dev.name) {
      firebaseOptions = firebase_dev.DefaultFirebaseOptions.currentPlatform;
      name = "BuildFlavorDev";
    } else {
      firebaseOptions = firebase_prod.DefaultFirebaseOptions.currentPlatform;
      name = "BuildFlavor";
    }
    log("message: name $name", name: 'Main');
    await Firebase.initializeApp(
      name: name,
      options: firebaseOptions,
    );
  }
}
