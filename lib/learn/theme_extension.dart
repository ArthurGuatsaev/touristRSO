import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyMaterialApp());
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  ThemeMode mode = ThemeMode.light;
  void changeMode() {
    setState(() {
      mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: [MyContainerTheme(backgroundColor: Colors.pink, topPading: 50, bottomPading: 50)]
      ),
      darkTheme: ThemeData(
        extensions: [MyContainerTheme(backgroundColor: const Color.fromARGB(255, 68, 68, 68), topPading: 100, bottomPading: 100)]
      ),
      themeMode: mode,
      home: const MyWidget()
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  MyContainerTheme? style;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    style = Theme.of(context).extension<MyContainerTheme>();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
         context.findAncestorStateOfType<_MyMaterialAppState>()!.changeMode();
      },),
      body: Center(child: Container(
        height: 300, width: 300,
        color: style?.backgroundColor ?? Colors.red,
        padding: EdgeInsets.only(top: style?.topPading ?? 0, bottom: style?.bottomPading?? 0),
        child: Container(color: Colors.blue,),
      )),
    );
  }
}


class MyContainerTheme extends ThemeExtension<MyContainerTheme> {
  final Color backgroundColor;
  final double topPading;
  final double bottomPading;

  MyContainerTheme({required this.backgroundColor, required this.topPading, required this.bottomPading});
  @override
  ThemeExtension<MyContainerTheme> copyWith({Color? backgroundColor, double? topPading, double? bottomPading}) {
    return MyContainerTheme(backgroundColor: backgroundColor??this.backgroundColor, topPading: topPading??this.topPading, bottomPading: bottomPading??this.bottomPading);
  }

  @override
  ThemeExtension<MyContainerTheme> lerp(covariant ThemeExtension<MyContainerTheme>? other, double t) {
    if (other is MyContainerTheme) {
      return MyContainerTheme(backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!, topPading: lerpDouble(topPading, other.topPading, t)!, bottomPading: lerpDouble(bottomPading, other.bottomPading, t)!);
    }
    return this;
  }
}