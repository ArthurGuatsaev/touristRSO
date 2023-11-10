import 'package:flutter/material.dart';

class ItemAppBar extends AppBar {
  ItemAppBar({super.key});
  @override
  Widget? get leading => Builder(
        builder: (context) {
          return IconButton(onPressed:() {},
            icon: const Icon(Icons.menu),);
        }
      );
}