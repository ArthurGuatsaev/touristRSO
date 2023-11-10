import 'package:flutter/material.dart';

class MyAppBar extends AppBar{
  MyAppBar({super.key});
  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => Colors.transparent;
  @override
  // TODO: implement elevation
  double? get elevation => 0;
  @override
  Widget? get title => Container(color: Colors.red);
  @override
  Widget? get leading =>Builder(
        builder: (context) {
          return MenuItemButton(child: const Icon(Icons.menu), onPressed: () {
            context.findAncestorStateOfType<ScaffoldState>()!.openDrawer();
          });
        }
      );
}