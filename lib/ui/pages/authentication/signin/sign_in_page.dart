import 'package:build_flavor/base/firebase/remote_config.dart';
import 'package:build_flavor/utils/app_colors.dart';
import 'package:build_flavor/utils/app_theme_state_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String appName = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    RemoteConfig.init().then(
      (value) {
        appName = RemoteConfig.remoteConfig.getString('app_name');
        isLoading = false;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: isLoading
          ? const Align(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(
                color: AppColors.black,
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "This app is running with flavor:",
                    style: context.appTheme.body14.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    appName,
                    style: context.appTheme.body14B.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
