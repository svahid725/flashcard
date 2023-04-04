import 'package:flutter/material.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';

class EnglishCardsDataEntity {
  final String phrase;
  final String meaning;
  final Color color;

  EnglishCardsDataEntity({
    required this.phrase,
    required this.meaning,
    this.color = DarkThemeColors.surfaceColor,
  });
}

class CardsDataInEnglishLanguage {
  static List<EnglishCardsDataEntity> get data {
    return [
      EnglishCardsDataEntity(
          phrase: 'President 1',
          meaning:
              'The president of our country made an important announcement 1.'),
      EnglishCardsDataEntity(
          phrase: 'President 2',
          meaning:
              'The president of our country made an important announcement 2.'),
      EnglishCardsDataEntity(
          phrase: 'President 3',
          meaning:
              'The president of our country made an important announcement 3.'),
      EnglishCardsDataEntity(
          phrase: 'President 4',
          meaning:
              'The president of our country made an important announcement 4.'),
      EnglishCardsDataEntity(
          phrase: 'President 5',
          meaning:
              'The president of our country made an important announcement 5.'),
      EnglishCardsDataEntity(
          phrase: 'President 6',
          meaning:
              'The president of our country made an important announcement 6.'),
      EnglishCardsDataEntity(
          phrase: 'President 7',
          meaning:
              'The president of our country made an important announcement 7.'),
    ];
  }
}
