import 'package:cuco_reminders/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.text,
    required this.asset,
    required this.indexValue,
  }) : super(key: key);

  final RichText text;
  final String asset;
  final int indexValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'CUCO',
              style: TextStyle(
                color: Color(0XFF173A24),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          const SizedBox(
            height: 100,
          ),
          SvgPicture.asset(
            asset,
            height: 200,
            width: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          text,
          const SizedBox(
            height: 100,
          ),
          indexValue == 2
              ? MaterialButton(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0XFF173A24).withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff1F7A35),
                          Color(0xff143621),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    width: 300,
                    height: 70,
                    child: const Center(
                      child: Text(
                        'Iniciar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                )
              : const SizedBox(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                ((index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: indexValue == index
                            ? const Color(0xff143621)
                            : const Color(0xff1F7A35),
                        shape: BoxShape.circle,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
