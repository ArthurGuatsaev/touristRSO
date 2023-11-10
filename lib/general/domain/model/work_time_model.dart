import 'package:my_webapp/general/domain/general_failure.dart';

class WorkTimeModel {
  final bool everyDayWork;
  final Map<String, DayOpenAndClosed> weekWorkTime;
  final UnusualWorkTime unusual;
  const WorkTimeModel(
      {this.everyDayWork = false,
      this.weekWorkTime = const {},
      this.unusual = const UnusualWorkTime()});
  WorkTimeModel fromJson({required Map<String, dynamic> json}) {
    return WorkTimeModel(
        everyDayWork: json['everyDayWork'],
        unusual: json['unusual'],
        weekWorkTime: (json['weekWorkTime'] as Map<String, DayOpenAndClosed>));
  }

  bool get isWeekEnd {
    const weekDay = 'cб'; // определение дня недели
    return weekWorkTime[weekDay]?._closed == 'выходной';
  }

  DateTime? get placeClosedTime {
    const weekDay = 'вс'; // определение дня недели
    return weekWorkTime[weekDay]?.closedTime;
  }

  DateTime? get placeOpenedTime {
    const weekDay = 'вс'; // определение дня недели
    return weekWorkTime[weekDay]?.openedTime;
  }

  // определение разницы текущего времени и времени окончания рабочего дня места
  Duration? get openClosed {
    final currentTime = DateTime.now();
    if (unusual.isToday) {
      if (unusual.placeClosedTime != null && unusual.placeOpenedTime != null) {
        final dif = currentTime.difference(placeClosedTime!);
        return dif;
      } else {
        throw const DateTimeParsingException(message: 'неверный формат даты');
      }
    } else {
      if (placeClosedTime != null && placeOpenedTime != null) {
        final dif = currentTime.difference(placeClosedTime!);
        return dif;
      } else {
        throw const DateTimeParsingException(message: 'неверный формат даты');
      }
    }
  }

  OpenClosedStatus? get workStatus {
    if (isWeekEnd) return OpenClosedStatus.weekEnd;
    if (openClosed != null) {
      // final workTime = placeClosedTime!.difference(placeOpenedTime!);
      if (openClosed!.inMinutes < 0) {
        return openClosed!.inMinutes > -60
            ? OpenClosedStatus.almostClosed
            : OpenClosedStatus.open;
      } else {
        if (timeBeforeWork != null && timeBeforeWork! > -60) {
          return OpenClosedStatus.almostOpen;
        } else {
          return OpenClosedStatus.closed;
        }
      }
    } else {
      return null;
    }
  }

  int? get timeBeforeWork {
    final workTime = placeOpenedTime?.difference(placeClosedTime!);
    return openClosed != null && workTime != null
        ? openClosed!.inMinutes - workTime.inMinutes
        : null;
  }
}

class DayOpenAndClosed {
  final String _opened;
  final String _closed;
  const DayOpenAndClosed({String opened = '', String closed = ''})
      : _opened = opened,
        _closed = closed;
  int hours(String time) => int.parse(time.substring(0, 2));
  int minuts(String time) => int.parse(time.substring(3));
  DateTime get ifNightWork => hours(_opened) > hours(_closed)
      ? DateTime.now().add(const Duration(days: 1))
      : DateTime.now();
  DateTime? get openedTime => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hours(_opened),
      minuts(_opened));
  DateTime? get closedTime => DateTime(DateTime.now().year,
      DateTime.now().month, ifNightWork.day, hours(_closed), minuts(_closed));
  String get timeOpenedForView => '${openedTime?.hour}:${openedTime?.minute}';
  String get timeClosedForView => '${closedTime?.hour}:${closedTime?.minute}';
  String get generalTimeForView => '$timeOpenedForView\n$timeClosedForView';
}

class UnusualWorkTime {
  final String title;
  final Map<String, DayOpenAndClosed> workTime;
  final String deleteTime;
  final List<String> activeDate;
  const UnusualWorkTime(
      {this.title = '',
      this.workTime = const {},
      this.deleteTime = '',
      this.activeDate = const []});
  UnusualWorkTime fromJson({required Map<String, dynamic> json}) {
    return UnusualWorkTime(
        activeDate:
            (json['activeDate'] as List).map((e) => e as String).toList(),
        deleteTime: json['deleteTime'],
        title: json['title'],
        workTime: (json['workTime']));
  }

  bool get isActive {
    final today =
        '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    return activeDate.contains(today);
  }

  bool get isToday {
    final today =
        '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    return workTime[today] != null;
  }

  DateTime? get placeClosedTime {
    final today =
        '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    return workTime[today]?.closedTime;
  }

  DateTime? get placeOpenedTime {
    final today =
        '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    return workTime[today]?.openedTime;
  }
}

enum OpenClosedStatus {
  open,
  closed,
  almostClosed,
  almostOpen,
  weekEnd;

  String get intoString {
    switch (this) {
      case OpenClosedStatus.open:
        return 'opened';
      case OpenClosedStatus.closed:
        return 'closed';
      case OpenClosedStatus.almostClosed:
        return 'almostClosed';
      case OpenClosedStatus.almostOpen:
        return 'almostOpen';
      case OpenClosedStatus.weekEnd:
        return 'weekEnd';
    }
  }
}
