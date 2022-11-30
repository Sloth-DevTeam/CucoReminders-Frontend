import 'package:cuco_reminders/screens/home_screen/model/reminder_model.dart';
import 'package:cuco_reminders/screens/home_screen/widgets/modal_edit_widget.dart';
import 'package:flutter/material.dart';

class RemindersWidget extends StatelessWidget {
  const RemindersWidget({
    Key? key,
    required this.reminder,
  }) : super(key: key);

  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    bool isHighPriority = reminder.prioridade > 5;

    var dataCompleta =
        DateTime.fromMillisecondsSinceEpoch(int.parse(reminder.dataVencimento));
    String diferenca = '${dataCompleta.difference(DateTime.now()).inDays}';
    bool expirou =
        (dataCompleta.difference(DateTime.now()) < const Duration(days: 1));

    return GestureDetector(
      onDoubleTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => ModalEditWidget(reminder: reminder),
          barrierColor: Colors.black.withOpacity(0.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
        );
      },
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          height: 125,
          width: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: expirou && isHighPriority
                  ? [
                      const Color(0xffFF391E),
                      const Color(0xffD51C03),
                    ]
                  : [
                      const Color(0xffC45F0B),
                      const Color(0xffF8BC28),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    int.parse(diferenca) == 0
                        ? 'Hoje'
                        : int.parse(diferenca) < 0
                            ? 'Expirou'
                            : 'Faltam $diferenca dias',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
