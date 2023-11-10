import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAdaptive());
}

class MyAdaptive extends StatefulWidget {
  const MyAdaptive({super.key});

  @override
  State<MyAdaptive> createState() => _MyAdaptiveState();
}

class _MyAdaptiveState extends State<MyAdaptive> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return MaterialApp(
          navigatorObservers: [x],
          theme: ThemeData(useMaterial3: true),
          home: const _HomePage());
    } else {
      return CupertinoApp(
        navigatorObservers: [x],
        home: const _FirstPage(),
      );
    }
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}

final x = RouteObserver();

class _HomePageState extends State<_HomePage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    x.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPop() {
    // TODO: implement didPop
    super.didPop();
    print('pop');
  }

  @override
  void didPush() {
    // TODO: implement didPush
    super.didPush();
    print('push');
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('hello cuper'),
            
          ),
          
          child: Center(
            child:
                CupertinoButton(child: const Text('press'), onPressed: () {}),
          ));
    } else {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.directions_walk_rounded)),
        ]),
        tabBuilder: (context, index) => CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar:const CupertinoNavigationBar(
                middle: Text('hello cuper'),
              ),
              child: Center(
                child: CupertinoButton(
                    child: const Text('press'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CupertinoPageScaffold(
                                backgroundColor: Colors.green,
                                navigationBar: CupertinoNavigationBar(),
                                child: Center(),
                              )));
                    }),
              ));
          }
        ));
    }
  }
}

class _FirstPage extends StatefulWidget {
  const _FirstPage({super.key});

  @override
  State<_FirstPage> createState() => __FirstPageState();
}

class __FirstPageState extends State<_FirstPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('hello cuper'),
          ),
          child: Center(
            child: CupertinoButton(
                child: const Text('press'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const _HomePage(),),);
                },),
          ),);
  }
}