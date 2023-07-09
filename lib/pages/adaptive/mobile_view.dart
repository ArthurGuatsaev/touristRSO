import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_webapp/colors.dart';
import 'package:my_webapp/data/const.dart';
import '../../generated/locale_keys.g.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: !kIsWeb ? Image.asset('assets/images/bg.png').image : Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/mywebapp-b8e3d.appspot.com/o/bg.png?alt=media&token=e1ca74d6-8785-4194-9b75-f71fd42bdef2',
                ).image)),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
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
                      height:
                          MediaQuery.of(context).size.height * 0.07),
                ),
                SliverGrid.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          mainAxisExtent: 150),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: placeItemColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          placesIcons[places[index]] ??
                              const Icon(Icons.home),
                          Text(
                            places[index].tr(),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    );
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
