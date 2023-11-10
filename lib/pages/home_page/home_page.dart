import 'package:flutter/material.dart';
import '../../widgets/adaptive.dart';
import '../../widgets/my_page.dart';
import 'desktop/home_page_desktop.dart';
import 'mobile/android_home_mobile.dart';
import 'mobile/ios_home.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomePage());
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WindowConstructor(
      desktop: HomePageDesktop(),
      planshet: HomePageDesktop(),
      mobile: MyWrapPlatformPage(
        android: HomePageByAndroid(),
        ios: HomePageByIos(),
      ),
    );
  }
}
