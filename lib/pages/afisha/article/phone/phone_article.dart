import 'package:flutter/material.dart';

class PhoneArticle extends StatelessWidget {
  const PhoneArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(color: Colors.green, 
        height: MediaQuery.of(context).size.height*0.6,
        width: MediaQuery.of(context).size.width - 10,
        ),
        const Text('title'),
        const Text('date'),
        const Text('description'),
      ],
    );
  }
}