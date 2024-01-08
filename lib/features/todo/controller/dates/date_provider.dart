import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'date_provider.g.dart';

// set date
@riverpod
class DateState extends _$DateState {
  @override
  String build() {
    return "";
  }

  void setDate(String newState) {
    state = newState;
  }
}

// set start time
@riverpod
class startTimeState extends _$startTimeState {
  @override
  String build() {
    return "";
  }

  void setStart(String newState) {
    state = newState;
  }

  List<int> dates(DateTime startDate) {
    DateTime now = DateTime.now();

    Duration difference = startDate.difference(now);

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    return [days, hours, minutes, seconds];
  }
}

// set end time
@riverpod
class finishTimeState extends _$finishTimeState {
  @override
  String build() {
    return "";
  }

  void setFinish(String newState) {
    state = newState;
  }
}
