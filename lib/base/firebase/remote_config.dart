import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfig {
  static final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> init() async {
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ));
      await remoteConfig.setDefaults({
        "app_name": '',
      });
      final result = await remoteConfig.fetchAndActivate();
      log("message fetchAndActivate: $result", name: "RemoteConfig");
    } catch (exception) {
      log("message RemoteConfig init exception: $exception", name: "RemoteConfig");
    }
  }
}
