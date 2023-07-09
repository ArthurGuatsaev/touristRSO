// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PlaceDiscription extends StatelessWidget {
  final String title;
  final String desc;
  final double height;
  const PlaceDiscription({
    Key? key,
    required this.title,
    required this.desc,
    required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber[200],
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width / 4,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              SizedBox(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
