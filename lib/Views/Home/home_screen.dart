import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Home/home_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';
import 'package:getx_flashcard/Widgets/my_appbar.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

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
                color: const Color(0xff2A2A2A).withOpacity(0.8),
              ),
              child: IconButton(
                  onPressed: () {
                    testDialog();
                  },
                  icon: const Icon(
                    Icons.flag_outlined,
                    color: Colors.white,
                  )),
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
          preferredSize: const Size.fromHeight(136),
          child: MyAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Obx(
              () => controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: DarkThemeColors.alertDialogTitleColor,
                      ),
                    )
                  : CarouselSlider.builder(
                      options: CarouselOptions(
                        padEnds: false,
                        onPageChanged: null,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        disableCenter: true,
                        height: Get.height / 1.32,
                        viewportFraction: 0.31,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        animateToClosest: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.vertical,
                      ),
                      itemCount: controller.flashCardDataModel.length,
                      itemBuilder: (context, index, realIndex) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          child: FlipAnimation(
                            duration: const Duration(milliseconds: 250),
                            child: FlashCardItem(
                              controller: controller,
                              index: index,
                            ),
                          ),
                        );
                      },
                    ),
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
                  DarkThemeColors.surfaceColor,
                  DarkThemeColors.surfaceColor.withOpacity(0.9),
                  DarkThemeColors.surfaceColor,
                ],
              ),
              borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            onTap: () {
              controller.translateIndex.value = index;
              controller.isEnglish.isTrue
                  ? controller.changeLanguage('per')
                  : controller.changeLanguage('eng');
              controller.isEnglish.isTrue
                  ? controller.isEnglish.value = false
                  : controller.isEnglish.value = true;
              controller.getFlashCards();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    controller.isEnglish.isTrue
                        ? controller.flashCardDataModel[index].questionTitle
                        : controller.questionTitlesList[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 29,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 36,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    controller.isEnglish.isTrue
                        ? controller.flashCardDataModel[index].question
                        : controller.questionList[index].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
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

Future testDialog() {
  return Get.defaultDialog(
      radius: 16,
      title: '',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '100 SECONDS TEST',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: DarkThemeColors.alertDialogTitleColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Are you ready? We show 20 flashcards.Time per card: 5 seconds',
            style: TextStyle(
              fontSize: 14,
              height: 1.7,
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(32, 0, 35, 0),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: Get.theme.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0, bottom: 10),
              child: TextButton(
                onPressed: () {
                  Get.back();
                  Get.toNamed(Routes.test.name);
                },
                child: Text(
                  'Start',
                  style: Get.theme.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: DarkThemeColors.alertDialogTitleColor),
                ),
              ),
            ),
          ],
        )
      ]);
}
