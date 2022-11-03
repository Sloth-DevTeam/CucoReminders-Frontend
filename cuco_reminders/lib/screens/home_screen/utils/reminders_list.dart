import 'package:cuco_reminders/screens/home_screen/model/reminder_model.dart';

class RemindersUtils {
  final List<Reminder> _listReminders = [];

  List<Reminder> readReminder() {
    _listReminders.addAll([
      Reminder(
        titulo: 'Jogo do Bahia',
        legenda: 'O Bahia precisa ganhar do CRB urgente',
        dataVencimento: DateTime.now().subtract(
          const Duration(days: 2),
        ),
      ),
    ]);
    return _listReminders;
  }

  List<Reminder> addReminder(Reminder reminder) {
    _listReminders.add(reminder);
    return _listReminders;
  }

  List<Reminder> removeReminder(Reminder reminder) {
    _listReminders.remove(reminder);
    return _listReminders;
  }

  List<Reminder> editReminder(Reminder reminder, Reminder newRemider) {
    reminder = newRemider;
    return _listReminders;
  }
}
