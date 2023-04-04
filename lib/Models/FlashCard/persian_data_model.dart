import 'package:flutter/material.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';

class PersianCardsDataEntity {
  final String phrase;
  final String meaning;
  final Color color;

  PersianCardsDataEntity({
    required this.phrase,
    required this.meaning,
    this.color = DarkThemeColors.emailTextColor,
  });
}

class CardsDataInPersian {
  static List<PersianCardsDataEntity> get data => [
        PersianCardsDataEntity(
          phrase: 'رییس جمهور اول',
          meaning: 'رییس جمهور اول کشور ما خبر مهمی داد.',
        ),
        PersianCardsDataEntity(
          phrase: 'رییس جمهور دوم',
          meaning: 'رییس جمهور دوم کشور ما خبر مهمی داد.',
        ),
        PersianCardsDataEntity(
          phrase: 'رییس جمهور سوم',
          meaning: 'رییس جمهور سوم کشور ما خبر مهمی داد.',
        ),
        PersianCardsDataEntity(
          phrase: 'رییس جمهور چهارم',
          meaning: 'رییس جمهور چهارم کشور ما خبر مهمی داد.',
        ),
        PersianCardsDataEntity(
          phrase: 'رییس جمهور پنجم',
          meaning: 'رییس جمهور پنجم کشور ما خبر مهمی داد.',
        ),
        PersianCardsDataEntity(
          phrase: 'رییس جمهور ششم',
          meaning: 'رییس جمهور ششم کشور ما خبر مهمی داد.',
        ),
        PersianCardsDataEntity(
          phrase: 'رییس جمهور هفتم',
          meaning: 'رییس جمهور هفتم کشور ما خبر مهمی داد.',
        ),
      ];
}
