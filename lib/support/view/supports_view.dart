import 'package:flutter/material.dart';

import '../domain/support_model.dart';

class SupportView extends StatelessWidget {
  final SupportMessageModel model;
  const SupportView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          right: model.userName == 'admin' ? 5 : MediaQuery.of(context).size.width * 0.3,
          left: model.userName == 'admin' ? MediaQuery.of(context).size.width * 0.3 : 5,
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: model.userName == 'admin' ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.only(topRight: Radius.circular(model.userName == 'admin' ? 0 : 20), topLeft: Radius.circular(model.userName == 'admin' ? 20 : 0), bottomLeft: const Radius.circular(20),bottomRight: const Radius.circular(20))),
              child: const SizedBox(height: 100, width: 100)
          ),
      );
  }
}