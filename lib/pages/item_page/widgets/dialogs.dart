import 'package:flutter/material.dart';
import 'package:my_webapp/pages/item_page/widgets/page_view_item.dart';

Future<dynamic> myRoomShowDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          content: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(16))));
    });

Future<dynamic> myRoomShowAdaptiveDialog(
        {required BuildContext context, required List<String> images}) =>
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              child: PageViewItem(
                images: images,
              ),
            ),
          );
        });
