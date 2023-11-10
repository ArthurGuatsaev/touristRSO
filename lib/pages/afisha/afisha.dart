import 'package:flutter/material.dart';
import 'package:my_webapp/pages/afisha/wall/phone/phone_afisha.dart';

class AfishaPage extends StatefulWidget {
  static String routeName = '/afisha';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: AfishaPage.routeName),
      builder: (context) => const AfishaPage());
  }
  const AfishaPage({super.key});

  @override
  State<AfishaPage> createState() => _AfishaPageState();
}

class _AfishaPageState extends State<AfishaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MultiLayoutCustomPhone()
    );
  }
}

