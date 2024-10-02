import 'package:build_flavor/base/firebase/remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading
            ? const CupertinoActivityIndicator(
                color: Colors.black,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You are running application flavor: ',
                  ),
                  Text(
                    appName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
      ),
    );
  }
}
