import 'package:flutter/material.dart';
import 'package:my_webapp/pages/item_page/widgets/appbar_item.dart';
import 'package:my_webapp/pages/menu_page/menu.dart';

import '../../../rating/view/rating_view.dart';
import '../widgets/image_item.dart';
import '../widgets/time_widget.dart';
import '../widgets/title_description.dart';

class DesctopItem extends StatelessWidget {
  const DesctopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: MainMenu(),),
      appBar: ItemAppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const ImageItemWidget(),
         ),
         const SingleChildScrollView(
          child: Column(children: [
            TitleWidget(),
            Hero(tag:'rating', child: RatingView()),
            SizedBox(height: 10),
            WorkTimeWidget(),
            SizedBox(height: 10),
            DescriptionWidget(),
            SizedBox(height: 10),
            // ResponseView()
          ]),
        )
      ],),
    );
  }
}