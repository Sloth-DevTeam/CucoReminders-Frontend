import 'package:cuco_reminders/screens/home_screen/bloc/reminder_bloc.dart';
import 'package:cuco_reminders/screens/home_screen/bloc/reminder_event.dart';
import 'package:cuco_reminders/screens/home_screen/bloc/reminder_state.dart';
import 'package:cuco_reminders/screens/home_screen/widgets/add_reminder_widget.dart';
import 'package:cuco_reminders/screens/home_screen/widgets/reminder_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ReminderBloc reminderBloc;

  @override
  void initState() {
    super.initState();
    reminderBloc = ReminderBloc();
    reminderBloc.inputDepesa.add(ReadReminderEvent());
  }

  @override
  void dispose() {
    reminderBloc.inputDepesa.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controleTitulo = TextEditingController();
    final controleDescricao = TextEditingController();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddReminderWidget(
              controleDescricao: controleTitulo,
              controleTitulo: controleDescricao,
              bloc: reminderBloc,
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
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xffE38929),
                Color(0xffFFAB00),
              ],
            ),
          ),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Color(0xff194429),
                  Color(0xff188534),
                ]),
          ),
        ),
        toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Reminders',
          style: TextStyle(
            color: Color(0xffF3A42C),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[
                Color(0xff194429),
                Color(0xff188534),
              ],
            ),
          ),
          height: 50,
        ),
      ),
      body: StreamBuilder<ReminderState>(
          stream: reminderBloc.stream,
          builder: (context, snapshot) {
            final remindersList = snapshot.data?.reminder ?? [];
            return ListView.builder(
              itemBuilder: ((context, index) => ReminderWidget(
                    controleDescricao: controleDescricao,
                    controleTitulo: controleTitulo,
                    bloc: reminderBloc,
                    reminder: remindersList[index],
                  )),
              itemCount: remindersList.length,
            );
          }),
    );
  }
}
