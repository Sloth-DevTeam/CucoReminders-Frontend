import 'package:cuco_reminders/screens/onBoarding_screen/widget/onboarding_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<OnBoardingWidget> onboardingPages = [
  OnBoardingWidget(
    text: RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'Bem vindo ao ',
        children: [
          TextSpan(
            text: 'Cuco,',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text:
                ' aplicativo criado para pessoas com muitas tarefas sejam elas,',
          ),
          TextSpan(
            text: ' profissionais ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(text: 'assim como'),
          TextSpan(
            text: ' pessoais',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        style: TextStyle(
          color: Color(0xff173A24),
          fontSize: 24,
        ),
      ),
    ),
    asset: 'assets/onBoarding-ilustration01.svg',
    indexValue: 0,
  ),
  OnBoardingWidget(
    text: RichText(
      text: const TextSpan(
        text: 'Seus ',
        children: [
          TextSpan(
            text: 'Reminders ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text:
                'serão todos armazenados em nosso banco e somente poderão ser vistos por você mesmo !',
          ),
        ],
        style: TextStyle(
          color: Color(0xff173A24),
          fontSize: 24,
        ),
      ),
      textAlign: TextAlign.center,
    ),
    asset: 'assets/onBoarding-ilustration02.svg',
    indexValue: 1,
  ),
  OnBoardingWidget(
    text: RichText(
      text: const TextSpan(
        text: 'Não existe nada melhor que marcar um ',
        children: [
          TextSpan(
            text: 'Check ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(text: 'em seus reminders !'),
        ],
        style: TextStyle(
          color: Color(0xff173A24),
          fontSize: 24,
        ),
      ),
      textAlign: TextAlign.center,
    ),
    asset: 'assets/onBoarding-ilustration03.svg',
    indexValue: 2,
  ),
];
