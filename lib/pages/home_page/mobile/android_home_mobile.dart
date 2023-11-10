import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../data/const.dart';
import '../../../generated/locale_keys.g.dart';
import '../widgets/home_place_item.dart';

class HomePageByAndroid extends StatelessWidget {
  const HomePageByAndroid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: !kIsWeb
                    ? Image.asset('assets/images/bg.png').image
                    : Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/mywebapp-b8e3d.appspot.com/o/bg.png?alt=media&token=e1ca74d6-8785-4194-9b75-f71fd42bdef2',
                      ).image)),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      LocaleKeys.title.tr(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07),
                ),
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 70),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return HomePagePlaceItem(index: index);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}