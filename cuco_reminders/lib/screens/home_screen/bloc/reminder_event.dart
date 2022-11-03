import 'package:cuco_reminders/screens/home_screen/model/reminder_model.dart';

abstract class ReminderEvent {}

class ReadReminderEvent extends ReminderEvent {}

class AddReminderEvent extends ReminderEvent {
  Reminder reminder;

  AddReminderEvent({required this.reminder});
}

class RemoveReminderEvent extends ReminderEvent {
  Reminder reminder;

  RemoveReminderEvent({required this.reminder});
}

class EditReminderEvent extends ReminderEvent {
  Reminder reminder;
  Reminder newReminder;

  EditReminderEvent({required this.reminder, required this.newReminder});
}
