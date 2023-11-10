import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/domain/model/work_time_model.dart';
import '../../../search/view/search_bloc/blok.dart';
void main() {
  runApp(const MaterialApp(home: Scaffold(body: Center(child: WorkTimeWidget()),)));
}
class WorkTimeWidget extends StatefulWidget {
  const WorkTimeWidget({super.key});

  @override
  State<WorkTimeWidget> createState() => _WorkTimeWidgetState();
}

class _WorkTimeWidgetState extends State<WorkTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey),
          child: Row(children: [
            for (var i = 0; i < 6; i ) DayWorkPart(dayOfWeek: i,),
          ]),
        );
  }
}

class DayWorkPart extends StatelessWidget {
  final int dayOfWeek;
  String get day {
    switch (dayOfWeek) {
      case 0: return 'пн';
      case 1: return 'вт';
      case 2: return 'ср';
      case 3: return 'чт';
      case 4: return 'пт';
      case 5: return 'сб';
      case 6: return 'вс';
      default: return '';
    }
  }
  const DayWorkPart({
    super.key,
    required this.dayOfWeek
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous.model.item.workTime != current.model.item.workTime,
      builder: (context, state) {
        final week = state.model.item.workTime.weekWorkTime;
        return Text(week[day]?.generalTimeForView ?? '');
          }
        )
      ],
    );
  }
}

class OpenClosedWidget extends StatelessWidget {
  final WorkTimeModel time;
  const OpenClosedWidget({
    super.key,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
          radius: 7,
          backgroundColor: time.workStatus?.colorStatus ?? Colors.transparent, // if ...
        );
  }
}

extension on OpenClosedStatus {
  Color get colorStatus {
    switch(this) {
      case OpenClosedStatus.almostOpen:
      case OpenClosedStatus.open: return Colors.green;
      case OpenClosedStatus.almostClosed:
      case OpenClosedStatus.weekEnd:
      case OpenClosedStatus.closed: return Colors.red;
    }
  }
}