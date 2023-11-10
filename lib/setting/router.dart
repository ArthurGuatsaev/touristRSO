import 'package:flutter/material.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/pages/afisha/afisha.dart';
import 'package:my_webapp/pages/afisha/article/article_page.dart';
import 'package:my_webapp/pages/home_page/home_page.dart';
import 'package:my_webapp/pages/item_page/item_page.dart';
import 'package:my_webapp/pages/list_item/item_list.dart';

class MyRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomePage.route();
      case '/item_list':
        return ItemList.route(settings.arguments as PlaceCategory);
      case '/item':
        return ItemPage.route();
      case '/afisha':
        return AfishaPage.route();
      case '/article':
        return ArticlePage.route();
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                      child: ElevatedButton(
                    child: const Icon(Icons.share_sharp),
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/item_list'),
                  )),
                ));
    }
  }
}
