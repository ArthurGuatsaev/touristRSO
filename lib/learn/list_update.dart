

import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: ListUpdateExample(),));
}
class ListUpdateExample extends StatefulWidget {
  const ListUpdateExample({super.key});

  @override
  State<ListUpdateExample> createState() => _ListUpdateExampleState();
}

class _ListUpdateExampleState extends State<ListUpdateExample> {
  @override
  Widget build(BuildContext context) {
    return Inher(
      model: MyModel(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () => context.dependOnInheritedWidgetOfExactType<Inher>()?.model.add(),),
            body: Builder(
              builder: (context) {
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ListView.builder(
                        itemCount: context.dependOnInheritedWidgetOfExactType<Inher>()?.model.list.length,
                        itemBuilder: (context, index) {
                          final icons = context.dependOnInheritedWidgetOfExactType<Inher>()?.model.list;
                        return GestureDetector(
                          onTap: () => context.dependOnInheritedWidgetOfExactType<Inher>()?.model.take(index),
                          child: ItemOfList(color: index.color, icon: icons![index],));
                      }),
                    ),
                    Expanded(child: Container(color: context.dependOnInheritedWidgetOfExactType<Inher>()?.model.color.color ?? Colors.transparent, child: Center(child: context.dependOnInheritedWidgetOfExactType<Inher>()?.model.itemWidget ?? const Icon(Icons.stop),)))
                  ],
                );
              }
            ),
          );
        }
      ),
    );
  }
}

class ItemOfList extends StatelessWidget {
  final Color color;
  final Widget icon;
  const ItemOfList({
    super.key,
    required this.color,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: color, height: 100, width: MediaQuery.of(context).size.width, child: icon);
  }
}

extension on int {
  Color get color {
    switch (this) {
      case 0: return Colors.red;
      case 1: return Colors.blue;
      case 2: return Colors.green;
      case 3: return Colors.grey;
      case 4: return Colors.black;
      default: return Colors.pink;
    }
  }
}
class MyModel extends ChangeNotifier {
  Widget itemWidget = const Icon(Icons.error);
  int color = 0;
  final List<Widget> _list = [];
  List<Widget> get list => _list;
  void add() {
    _list.add(const Icon(Icons.home));
    notifyListeners();
  }
  void take(int index) {
    itemWidget = list[index];
    color = index;
    notifyListeners();
  }
}
class Inher extends InheritedNotifier<MyModel> {
  final Widget child;
  final MyModel model;
  const Inher({super.key, required this.child, required this.model}) : super(child: child, notifier: model);
  
}