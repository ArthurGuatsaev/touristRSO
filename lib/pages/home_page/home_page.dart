import 'package:flutter/material.dart';
import 'package:my_webapp/pages/adaptive/fullscreen_view.dart';
import 'package:my_webapp/pages/adaptive/little_view.dart';
import 'package:my_webapp/pages/adaptive/mobile_view.dart';

import '../adaptive/constructor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WindowConstructor(
      full: HomePageFull(),
      little: HomePageLittle(),
      mobile: HomePageMobile(),
    );
  }
}


