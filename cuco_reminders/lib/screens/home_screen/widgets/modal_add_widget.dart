import 'package:flutter/material.dart';

class ModalAddWidget extends StatelessWidget {
  const ModalAddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.8,
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
                  // controller: controleTitulo,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.notifications),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Titulo',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                // Prioridade
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: DropdownButton(
                    items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
                // Data de entrega
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
