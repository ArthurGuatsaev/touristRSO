import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FutureBuilderLearn {
  Future<int> getInt() async {
    return 123;
  }

  Stream<int> getStream() async* {
    for(var i = 0; i < 100; i ++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Builder(builder:(context) {
        if(kIsWeb){
          return const Icon(Icons.web);
        }
        if (Platform.isAndroid) {
          return const Icon(Icons.android);
        }
        if (Platform.isIOS) {
          return const Icon(Icons.apple);
        }
        return const Icon(Icons.error);
      }, )),
    );
  }
}