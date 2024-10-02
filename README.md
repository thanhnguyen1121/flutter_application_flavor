# build_flavor

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.
This support multiple build flavor like: env, app icon.  

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## FLUTTER_FIRE CONFIGURE CONFIG COMMAND
* For DEV
```
flutterfire configure --out "lib/prod_firebase_options.dart" --android-app-id "com.tz.build.flavor.example.build_flavor" --ios-bundle-id "com.tz.build.flavor.example.buildFlavor"
```
* For PROD
```
flutterfire configure --out "lib/dev_firebase_options.dart" --android-app-id "com.tz.build.flavor.example.build_flavor.dev" --ios-bundle-id "com.tz.build.flavor.example.buildFlavor.dev"
```



## RUN PROJECT COMMAND
* For Dev
```
 fvm flutter run --flavor dev --dart-define=FLAVOR=dev
```
* For Prod
```
 fvm flutter run --flavor prod --dart-define=FLAVOR=prod
```

## BUILD PROJECT COMMAND
* For ANDROID
```
fvm flutter build android --flavor dev --dart-define=FLAVOR=dev
fvm flutter build android --flavor prod --dart-define=FLAVOR=prod
```

* For IOS
```
fvm flutter build ios --flavor dev --dart-define=FLAVOR=dev
fvm flutter build ios --flavor prod --dart-define=FLAVOR=prod
```

## DOCUMENTATION
- [Build project follow by post](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)