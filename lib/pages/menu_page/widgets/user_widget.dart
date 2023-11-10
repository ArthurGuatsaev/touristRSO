import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox( // if (block.state....) sizedBox.shrink or Text(registration)
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 30,
          ),
          Container(width: 50, height: 10, color: Colors.black,)
        ],
      ),
    );
  }
}