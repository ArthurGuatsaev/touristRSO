import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpExample extends StatefulWidget {
  const PopUpExample({super.key});

  @override
  State<PopUpExample> createState() => _PopUpExampleState();
}

class _PopUpExampleState extends State<PopUpExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () => showAboutDialog(context: context),
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () => showGeneralDialog(
                  context: context,
                  pageBuilder: (context, _, __) => Container(
                        color: Colors.blue,
                        height: 200,
                        width: 299,
                      )),
            ),
            IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => Container(
                          width: 199,
                          height: 100,
                          color: Colors.amber,
                        ))),
            IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => showMenu(
                        context: context,
                        position: RelativeRect.fromSize(
                            Rect.fromCircle(center: Offset.zero, radius: 100),
                            Size(100, 100)),
                        items: [
                          PopupMenuItem(
                            child: Container(
                              width: 30,
                              height: 10,
                              color: Colors.pink,
                            ),
                          ),
                          PopupMenuItem(
                            child: Container(
                              width: 30,
                              height: 10,
                              color: Colors.yellow,
                            ),
                          )
                        ])),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () => showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025)),
            ),
            IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => showBottomSheet(
                    context: context,
                    builder: (context) => Container(
                          width: 100,
                          height: 100,
                          color: Colors.black,
                        ))),
            IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () =>
                    showSearch(context: context, delegate: MySearch())),
            IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => Container(
                          width: 200,
                          height: 200,
                          color: Colors.grey,
                        ))),
            IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => showLicensePage(context: context)),
            IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                          width: 200,
                          height: 200,
                          color: Colors.green,
                        ))),
          ],
        );
      }),
    );
  }
}

class MySearch extends SearchDelegate<Widget> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Icon(Icons.home),
      const Icon(Icons.done),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Icon(Icons.done);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Icon(Icons.home);
  }
}
