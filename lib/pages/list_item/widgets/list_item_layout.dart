import 'package:flutter/material.dart';
import 'package:my_webapp/pages/list_item/desctop/desctop_list_items.dart';
import 'package:my_webapp/pages/list_item/phone/phone_list_items.dart';
import 'package:my_webapp/pages/list_item/phone_albom/phone_albom.dart';
import 'package:my_webapp/pages/list_item/planshet/planshet_list_items.dart';

class ListLayautBuilder extends StatelessWidget {
  const ListLayautBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <900 && constraints.maxHeight < constraints.maxWidth) {
          return const PhoneAlbomListItems();
        } else if(constraints.maxWidth < 600 ) {
          return const PhoneListItems();
        } else if (constraints.maxWidth < 1000) {
          return const PlanshetListItems();
        } else {
        return const DesctopListItems();
        }
      }
    );
  }
}