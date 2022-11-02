import 'package:flutter/material.dart';

class AddReminderWidget extends StatefulWidget {
  const AddReminderWidget({Key? key}) : super(key: key);

  @override
  State<AddReminderWidget> createState() => _AddReminderWidgetState();
}

class _AddReminderWidgetState extends State<AddReminderWidget> {
  @override
  Widget build(BuildContext context) {
    void _submitForm() {
      setState(() {});
    }

    return Container(
      padding: const EdgeInsets.all(30),
      height: 800,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Color(0xffE38929),
            Color(0xffF8BC28),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              'Adicionar Reminder',
              style: TextStyle(
                color: Color(0xff194429),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.notifications),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Titulo',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Data de Inicio',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Descrição',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0XFFFFA43D).withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 30,
                    offset: const Offset(
                      0,
                      0,
                    ), // changes position of shadow
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff194429),
                    Color(0xff188534),
                  ],
                ),
                borderRadius: BorderRadius.circular(60),
              ),
              width: 300,
              height: 70,
              child: const Center(
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
