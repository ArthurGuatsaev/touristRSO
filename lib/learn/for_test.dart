import 'package:flutter/material.dart';

void main() {
  runApp(const MyApps());
}
class ForTest extends StatefulWidget {
  const ForTest({super.key});

  @override
  State<ForTest> createState() => _ForTestState();
}

class _ForTestState extends State<ForTest> {
  MyModelForTest? model;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.model;
  }
  @override
  Widget build(BuildContext context) {
    final newModel = model ?? MyModelForTest();
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(child: const Icon(Icons.home), onPressed: () {
           newModel.addIcon();
          },),
          for(var i in newModel.lists) i
        ],
      ))
    );
  }
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyInheritedWidget(model: MyModelForTest(), child: const ForTest()),);
  }
}


class MyModelForTest extends ChangeNotifier {
  final List<Icon> _lists = [];
  List<Icon> get lists => _lists;
  void addIcon() {
    _lists.add(const Icon(Icons.navigate_next));
    notifyListeners();
  }
  void remove() {
    _lists.removeLast();
    notifyListeners();
  }
}

class MyInheritedWidget extends InheritedNotifier<MyModelForTest> {
  const MyInheritedWidget({required super.child, required this.model, super.key}) : super(notifier: model );
  final MyModelForTest model;
}

