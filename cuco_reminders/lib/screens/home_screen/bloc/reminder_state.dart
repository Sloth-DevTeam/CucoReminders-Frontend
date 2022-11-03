import 'package:cuco_reminders/screens/home_screen/model/reminder_model.dart';

abstract class ReminderState {
  List<Reminder> reminder;

  ReminderState({required this.reminder});
}

class ReminderInitialState extends ReminderState {
  ReminderInitialState() : super(reminder: []);
}

class ReminderSucessState extends ReminderState {
  ReminderSucessState({required List<Reminder> reminder})
      : super(reminder: reminder);
}
