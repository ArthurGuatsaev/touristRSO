import 'package:flutter/material.dart';

import '../../../rating/view/rating_view.dart';
import '../../menu_page/menu.dart';
import '../widgets/appbar_item.dart';
import '../widgets/image_item.dart';
import '../widgets/time_widget.dart';
import '../widgets/title_description.dart';

class PhoneItemAndroid extends StatelessWidget {
  const PhoneItemAndroid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: MainMenu(),),
      appBar: ItemAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width, child: const ImageItemWidget()),
            const SizedBox(height: 10),
            const TitleWidget(),
            const Hero(tag:'rating', child: RatingView()),
            const SizedBox(height: 10),
            const WorkTimeWidget(),
            const SizedBox(height: 10),
            const DescriptionWidget(),
            
            // const ResponseView()
          ],
        ),
      ),
    );
  }
}



