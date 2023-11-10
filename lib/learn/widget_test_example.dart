import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MaterialApp(home: Scaffold(body: Center(child: WidgetTestExample()),),));
}
class WidgetTestExample extends StatefulWidget {
  const WidgetTestExample({super.key});

  @override
  State<WidgetTestExample> createState() => _WidgetTestExampleState();
}

class _WidgetTestExampleState extends State<WidgetTestExample> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncrementBloc(),
      child: Builder(
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16)), 
              color: Colors.blue),
            width: 100,
            height: 100,
            child: BlocBuilder<IncrementBloc, int>(
              builder: (context, state) {
                return Text('$state');
              }
            ),
          );
        }
      ),
    );
  }
}

class IncrementBloc extends Bloc<IncrementEvent, int>{
  IncrementBloc() : super(0) {
    on<AddEvent>(onAdd);
  }
  onAdd(AddEvent event, Emitter<int> emit) {
    int number = state;
    number += 1;
    emit(number);
  }
}
abstract class IncrementEvent{}
class AddEvent extends IncrementEvent {}