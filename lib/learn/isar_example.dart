import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'isar_example.g.dart';

@collection
class MyIsarCollection {
  Id id = Isar.autoIncrement;
  final String name;
  final int costs;
  MyIsarCollection({required this.costs, required this.name});
}

class PersistanceManager {
  Isar? _isar;
  Future<Isar> get isarGetter async {
    final apDir = await getApplicationDocumentsDirectory();
    _isar ??= await Isar.open([MyIsarCollectionSchema], directory: apDir.path);
    return _isar!;
  }

  Future<void> deleteCollection() async {
    final isar = await isarGetter;
    await isar.writeTxn(() async => await isar.myIsarCollections.clear());
  }

  Future<List<MyIsarCollection>> getIsar() async {
    final isar = await isarGetter;
    final col = await isar.myIsarCollections.where().findAll();
    return col;
  }

  Future<void> saveIsar({required MyIsarCollection col}) async {
    final isar = await isarGetter;
    isar.writeTxn(() async => isar.myIsarCollections.put(col));
  }
}

void main() {
  runApp(const CupertinoApp(
    home: CupertinoPageScaffold(
      child: _MyIsarExampleWidget(),
    ),
  ));
}

final arty = MyIsarCollection(costs: 100, name: 'arty');
final ser = MyIsarCollection(costs: 32, name: 'ser');

class _MyIsarExampleWidget extends StatefulWidget {
  const _MyIsarExampleWidget({super.key});

  @override
  State<_MyIsarExampleWidget> createState() => __MyIsarExampleWidgetState();
}

class __MyIsarExampleWidgetState extends State<_MyIsarExampleWidget> {
  PersistanceManager manager = PersistanceManager();
  MyIsarCollection? item;
  Future<List<MyIsarCollection>>? newCollection;
  final controller = TextEditingController();
  final controllerCost = TextEditingController();
  @override
  void initState() {
    super.initState();
    // newCollection = manager.getIsar();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: controller,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoTextField(
              keyboardType: TextInputType.phone,
              controller: controllerCost,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
            ),
            CupertinoButton(
                child: const Icon(Icons.done),
                onPressed: () {
                  final file = File('hel.txt');
                  file.writeAsStringSync('contents');
                  // item = MyIsarCollection(
                  //     costs: int.tryParse(controllerCost.text)!,
                  //     name: controller.text);
                  // manager.saveIsar(col: item!);
                  // setState(() {
                  //   newCollection = manager.getIsar();
                  // });
                }),
            CupertinoButton(
                child: const Icon(Icons.delete),
                onPressed: () async {
                  await manager.deleteCollection();
                  newCollection = manager.getIsar().whenComplete(() {
                    setState(() {});
                  });
                }),
            FutureBuilder(
              future: newCollection,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  final x = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < x.length; i++)
                        Container(
                          color: Colors.blue.withOpacity(0.5),
                          child: Column(
                            children: [Text(x[i].name), Text('${x[i].costs}')],
                          ),
                        )
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
