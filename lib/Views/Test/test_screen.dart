import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Home/home_controller.dart';
import 'package:getx_flashcard/Controllers/Test/test_controller.dart';
import 'package:getx_flashcard/Models/FlashCard/english_data_model.dart';
import 'package:getx_flashcard/Models/FlashCard/persian_data_model.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';
import 'package:getx_flashcard/Views/AddNewFlashcard/add_new_flashcard_screen.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);
  final TestController controller = Get.put(TestController());
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DarkThemeColors.alertDialogTitleColor,
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.flag_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 60,
              //Get.height/14,
              width: 60,
              //Get.height/14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff2a2a2a).withOpacity(0.8),
              ),
              child: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.volume_up_rounded,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height / 8),
          child: AppBar(
            elevation: 0,
            title: const Text(
              'My Flashcards',
              style: TextStyle(
                  fontFamily: 'Satisfy',
                  fontSize: 21,
                  color: DarkThemeColors.onBackground),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              margin: const EdgeInsets.fromLTRB(24, 72, 24, 16),
              height: Get.height / 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'N',
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      color: DarkThemeColors.alertDialogTitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Um',
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: DarkThemeColors.alertDialogTitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '4/20',
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: DarkThemeColors.alertDialogTitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    '|',
                    style: Get.textTheme.bodyText1!.apply(
                        color: DarkThemeColors.secondaryTextColor,
                        fontSizeFactor: 1.2),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    'T',
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      color: DarkThemeColors.alertDialogTitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'IME',
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: DarkThemeColors.alertDialogTitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '5:00',
                    style: Get.textTheme.bodyText1!.apply(
                      color: DarkThemeColors.alertDialogTitleColor,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              PopupMenuButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      Get.toNamed(Routes.login.name);
                      break;
                    case 2:
                      Get.defaultDialog(
                        title: 'DONATE',
                        titlePadding: const EdgeInsets.only(top: 32),
                        titleStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                        backgroundColor: Colors.white,
                        radius: 16,
                        content: Column(
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              'I\'m so happy to make this product for all English students around the world, So, if you enjoyed it so far, make sure you share it and donate to us.',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyText2!.copyWith(
                                color: const Color(0xff888888),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              'PayPal portal for everyone',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyText2!.copyWith(
                                color: const Color(0xff888888),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0),
                                shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xffEBECF0),
                                ),
                              ),
                              onPressed: () {},
                              child: const SizedBox(
                                width: 224,
                                height: 40,
                                child: Center(
                                  child: Text('PayPal'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 27),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: const Color(0xffACACAC)
                                        .withOpacity(0.4),
                                    thickness: 1,
                                    indent: 5,
                                    endIndent: 20,
                                  ),
                                ),
                                Text(
                                  'or',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                    color: const Color(0xff888888),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: const Color(0xffACACAC)
                                        .withOpacity(0.4),
                                    thickness: 1,
                                    endIndent: 5,
                                    indent: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'درگاه پرداخت ایرانیان',
                              style: Get.textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                color: const Color(0xff888888),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0),
                                shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xffEBECF0),
                                ),
                              ),
                              onPressed: () {},
                              child: const SizedBox(
                                width: 224,
                                height: 40,
                                child: Center(
                                  child: Text('زرین پال'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 32),
                      );
                  }
                },
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      value: 1,
                      child: Text(
                        'Personal page',
                        style: TextStyle(
                          color: Color(0xffEBE78A),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: Text('Share application'),
                    ),
                    PopupMenuItem(
                      child: Text('Send feedback'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Donate'),
                    ),
                  ];
                },
              )
            ],
            leading: IconButton(
              onPressed: () {
                Get.to(
                  AddNewFlashCardScreen(),
                );
              },
              icon: const Icon(Icons.add, color: DarkThemeColors.onBackground),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                padEnds: false,
                onPageChanged: null,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                disableCenter: true,
                height: 700,
                viewportFraction: 0.30,
                initialPage: 0,
                enableInfiniteScroll: false,
                animateToClosest: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.vertical,
              ),
              itemCount: CardsDataInEnglishLanguage.data.length,
              itemBuilder: (context, index, realIndex) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: FlipAnimation(
                    duration: const Duration(milliseconds: 250),
                    child: FlashCardItem(
                      controller: homeController,
                      index: index,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FlashCardItem extends StatelessWidget {
  const FlashCardItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);
  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Container(
          height: Get.height / 4, //200
          margin: EdgeInsets.symmetric(vertical: Get.height / 80),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CardsDataInEnglishLanguage.data[index].color.withOpacity(1),
                    CardsDataInEnglishLanguage.data[index].color
                        .withOpacity(0.9),
                    CardsDataInEnglishLanguage.data[index].color.withOpacity(1),
                  ]),
              borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            onTap: () {

              // controller.translateIndex.value = index;
              // controller.flashCardsPhraseList.value =
              //     phraseItemsList(controller.translateIndex.value);
              // controller.flashCardsMeaningList.value =
              //     meaningItemsList(controller.translateIndex.value);
              controller.isEnglish.isTrue
                  ? controller.changeLanguage('per')
                  : controller.changeLanguage('eng');
              controller.isEnglish.isTrue
                  ? controller.isEnglish.value = false
                  : controller.isEnglish.value = true;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'aaaa',
                  // controller.isEnglish.isTrue
                  //     ? CardsDataInEnglishLanguage.data[index].phrase
                  //     : controller.flashCardsPhraseList[index].toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Get.height / 36,
                ),
                Text(
                  'sss',
                  // controller.isEnglish.isTrue
                  // ? CardsDataInEnglishLanguage.data[index].meaning
                  // : controller.flashCardsMeaningList[index].toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

List phraseItemsList(int index) {
  // final List<EnglishCardsDataEntity> english = CardsDataInEnglishLanguage.data;
  // final List<PersianCardsDataEntity> farsi = CardsDataInPersian.data;
  final List flashCardsPhraseList = [];
  // for (int items = 0; items < english.length; items++) {
  //   flashCardsPhraseList.add(english[items].phrase);
  // }
  // flashCardsPhraseList[index] = farsi[index].phrase;
  return flashCardsPhraseList;
}

List meaningItemsList(int index) {
  // final HomeController controller = Get.find();
  // final List<EnglishCardsDataEntity> english = CardsDataInEnglishLanguage.data;
  // final List<PersianCardsDataEntity> farsi = CardsDataInPersian.data;
  final List flashCardsMeaningList = [];
  // for (int items = 0; items < english.length; items++) {
  //   flashCardsMeaningList.add(english[items].meaning);
  // }
  // flashCardsMeaningList[index] = farsi[index].meaning;
  return flashCardsMeaningList;
}
