import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyWrapPlatformPage extends StatelessWidget {
  final Widget android;
  final Widget ios;
  const MyWrapPlatformPage(
      {super.key, required this.android, required this.ios});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        body: android,
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return Scaffold(body: android);
      case TargetPlatform.iOS:
        return CupertinoPageScaffold(child: ios);
      default:
        return Scaffold(
          body: android,
        );
    }
  }
}
