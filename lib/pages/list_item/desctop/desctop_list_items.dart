import 'package:flutter/material.dart';

class DesctopListItems extends StatelessWidget {
  const DesctopListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: CustomScrollView(
              slivers: [SliverGrid.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.4, mainAxisSpacing: 20, crossAxisSpacing: 20, childAspectRatio: 16/9), itemBuilder: (context, index) {
              return Container(color: Colors.blue);
            }),])
          ),
        ),
        const SizedBox(width: 20),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.3,
                color: Colors.amber,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.3,
                color: Colors.blue,
              ),
            ],
          ),
        )
      ],
    );
  }
}

