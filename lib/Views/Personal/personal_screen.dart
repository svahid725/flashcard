import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Home/home_controller.dart';
import 'package:getx_flashcard/Models/FlashCard/english_data_model.dart';
import 'package:getx_flashcard/Models/FlashCard/persian_data_model.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Views/AddNewFlashcard/add_new_flashcard_screen.dart';

class PersonalScreen extends StatelessWidget {
  PersonalScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff303845),
          child: const Icon(Icons.save,
              color: DarkThemeColors.alertDialogTitleColor),
        ),
        backgroundColor: Colors.black,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: AppBar(
                  leading: InkWell(
                    onTap: () {
                      Get.back();
                      //     Get.toNamed(Home)
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: DarkThemeColors.onBackground,
                    ),
                  ),
                  title: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Andy Jackson',
                            style: Get.theme.textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w800,
                                color: DarkThemeColors.onBackground),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'RE79.Aliasghar@gmail.com',
                            style: Get.theme.textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: DarkThemeColors.emailTextColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  actions: [
                    homeController.isStudent.isFalse
                        ? IconButton(
                            onPressed: () {
                              Get.to(
                                AddNewFlashCardScreen(),
                              );
                            },
                            icon: const Icon(Icons.add,
                                color: DarkThemeColors.onBackground),
                          )
                        : Container(),
                  ],
                  elevation: 0,
                  flexibleSpace: Container(
                    margin: const EdgeInsets.fromLTRB(24, 64, 24, 0),
                    width: Get.width,
                    height: 60,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: 106,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(color: const Color(0xff222222))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Num 1'),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.clear, size: 12),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ];
          },
          scrollDirection: Axis.vertical,
          body: Container(
            margin: const EdgeInsets.fromLTRB(24, 32, 24, 0),
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final List<PersianCardsDataEntity> persionData =
                          CardsDataInPersian.data;
                      final List<EnglishCardsDataEntity> englishData =
                          CardsDataInEnglishLanguage.data;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        height: 400,
                        width: 312,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              DarkThemeColors.surfaceColor.withOpacity(1),
                              DarkThemeColors.surfaceColor.withOpacity(0.85),
                              DarkThemeColors.surfaceColor.withOpacity(1),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 47),
                            Text(
                              englishData[index].phrase,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 29,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              englishData[index].meaning.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 95),
                            Text(
                              persionData[index].phrase,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 29,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              persionData[index].meaning.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
