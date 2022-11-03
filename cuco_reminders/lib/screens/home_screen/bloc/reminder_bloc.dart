import 'dart:async';

import 'package:cuco_reminders/screens/home_screen/bloc/reminder_event.dart';
import 'package:cuco_reminders/screens/home_screen/bloc/reminder_state.dart';
import 'package:cuco_reminders/screens/home_screen/model/reminder_model.dart';
import 'package:cuco_reminders/screens/home_screen/utils/reminders_list.dart';

class ReminderBloc {
  final _reminderList = RemindersUtils();

  final StreamController<ReminderEvent> _inputReminderControll =
      StreamController<ReminderEvent>();
  final StreamController<ReminderState> _outputReminderControll =
      StreamController<ReminderState>();

  Sink<ReminderEvent> get inputDepesa => _inputReminderControll.sink;

  Stream<ReminderState> get stream => _outputReminderControll.stream;

  ReminderBloc() {
    _inputReminderControll.stream.listen(_mapEvent);
  }

  _mapEvent(ReminderEvent event) {
    List<Reminder> reminder = [];

    if (event is ReadReminderEvent) {
      reminder = _reminderList.readReminder();
    } else if (event is AddReminderEvent) {
      reminder = _reminderList.addReminder(event.reminder);
    } else if (event is RemoveReminderEvent) {
      reminder = _reminderList.removeReminder(event.reminder);
    } else if (event is EditReminderEvent) {
      reminder = _reminderList.editReminder(event.reminder, event.reminder);
    }
    _outputReminderControll.add(ReminderSucessState(reminder: reminder));
  }
}
