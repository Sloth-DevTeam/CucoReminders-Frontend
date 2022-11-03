import 'package:cuco_reminders/screens/home_screen/bloc/reminder_bloc.dart';
import 'package:cuco_reminders/screens/home_screen/bloc/reminder_event.dart';
import 'package:cuco_reminders/screens/home_screen/model/reminder_model.dart';
import 'package:cuco_reminders/screens/home_screen/widgets/edit_reminder_widget.dart';
import 'package:flutter/material.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({
    Key? key,
    required this.reminder,
    required this.bloc,
    required this.controleDescricao,
    required this.controleTitulo,
  }) : super(key: key);

  final Reminder reminder;
  final ReminderBloc bloc;
  final TextEditingController controleTitulo;
  final TextEditingController controleDescricao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => EditReminderWidget(
            bloc: bloc,
            controleDescricao: controleDescricao,
            controleTitulo: controleTitulo,
            reminder: reminder,
          ),
          barrierColor: Colors.black.withOpacity(0.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
        );
      },
      child: Dismissible(
        background: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: const [
                Icon(Icons.check, color: Colors.white),
              ],
            ),
          ),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.delete, color: Colors.white),
              ],
            ),
          ),
        ),
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.startToEnd) {
            RemoveReminderEvent(reminder: reminder);
            print("Add to favorite");
          } else {
            bloc.inputDepesa.add(
              RemoveReminderEvent(reminder: reminder),
            );
          }
        },
        key: ObjectKey(reminder),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            height: 125,
            width: 500,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Color(0xffE38929),
                  Color(0xffFFAB00),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reminder.titulo,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  reminder.legenda,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
