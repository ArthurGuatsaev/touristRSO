import 'package:flutter/material.dart';
import 'package:my_webapp/pages/item_page/phone/phone_item.dart';
import 'package:my_webapp/pages/item_page/phone/phone_item_ios.dart';
import 'package:my_webapp/pages/item_page/planshet/planshet_item.dart';
import 'package:my_webapp/widgets/adaptive.dart';
import 'package:my_webapp/widgets/my_page.dart';
import 'desctop/desctop_item.dart';

class ItemPage extends StatelessWidget {
  static const String routeName = '/item';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: ItemPage.routeName),
        builder: (context) => const ItemPage());
  }

  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WindowConstructor(
        desktop: DesctopItem(),
        planshet: PlanshetItem(),
        mobile: MyWrapPlatformPage(
            android: PhoneItemAndroid(), ios: PhoneItemIos()));
  }
}
