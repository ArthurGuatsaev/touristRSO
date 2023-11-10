import 'package:flutter/material.dart';

class DesctopArticle extends StatelessWidget {
  const DesctopArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: Colors.green, 
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.6,
        ),
        const Column(
          children: [
            Text('title'),
            Text('date'),
            Text('description'),
          ],
        ),
      ],
    );
  }
}