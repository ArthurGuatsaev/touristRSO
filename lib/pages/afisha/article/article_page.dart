import 'package:flutter/material.dart';
import 'package:my_webapp/pages/afisha/article/phone/phone_article.dart';

import 'desctop/desctop_article.dart';


class ArticlePage extends StatefulWidget {
  static const String routeName = '/article';
  static Route route() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 250),
      settings: const RouteSettings(name: routeName),
      pageBuilder: (context, _, __) {
      return const ArticlePage();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(animation),
        child: const ArticlePage());
    },
    );
  }
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        switch(constraints.maxWidth) {
          case < 1000: return const PhoneArticle();
          case > 1000: return const DesctopArticle();
          default: return Container();
        }
      },),
    );
  }
}

