// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class OnBoarding extends StatelessWidget {
//   const OnBoarding({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xffE38929),
//               Color(0xffF4A62C),
//               Color(0xffFFAB00),
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             AppBar(
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               title: const Text(
//                 'CUCO',
//                 style: TextStyle(
//                   color: Color(0xff173A24),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               centerTitle: true,
//             ),
//             IntroductionScreen(
//               done: const Text(
//                 'Done',
//                 style: TextStyle(
//                   color: Color(0xff173A24),
//                 ),
//               ),
//               onDone: () {},
//               pages: [
//                 PageViewModel(
//                   image:
//                       SvgPicture.asset('assets/onBoarding-ilustration01.svg'),
//                   title:
//                       'Bem vindo ao Cuco, aplicativo criado para para pessoas com muitas tarefassejam elas profissionais assim como pessoais ',
//                 ),
//                 PageViewModel(
//                   image:
//                       SvgPicture.asset('assets/onBoarding-ilustration01.svg'),
//                   title:
//                       'Bem vindo ao Cuco, aplicativo criado para para pessoas com muitas tarefassejam elas profissionais assim como pessoais ',
//                 ),
//                 PageViewModel(
//                   image:
//                       SvgPicture.asset('assets/onBoarding-ilustration01.svg'),
//                   title:
//                       'Bem vindo ao Cuco, aplicativo criado para para pessoas com muitas tarefassejam elas profissionais assim como pessoais ',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
