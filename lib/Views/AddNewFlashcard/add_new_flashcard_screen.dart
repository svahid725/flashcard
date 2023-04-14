import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/AddNewFlashcard/add_new_flashcard_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';
import 'package:getx_flashcard/Widgets/borderless_textfield.dart';
import 'package:getx_flashcard/Widgets/my_elevated_button.dart';

class AddNewFlashCardScreen extends StatelessWidget {
  AddNewFlashCardScreen({Key? key}) : super(key: key);
  final AddNewFlashCardController controller = Get.put(
    AddNewFlashCardController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.close,
            color: DarkThemeColors.onBackground,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'New words',
                  style: TextStyle(
                      fontSize: 33,
                      fontFamily: 'satisfy',
                      color: DarkThemeColors.onBackground),
                ),
              ),
              SizedBox(height: Get.height / 20),
              BorderLessInput(
                label: 'English word',
                controller: controller.questionTitleController,
              ),
              SizedBox(height: Get.height / 20),
              BorderLessInput(
                label: 'Translation',
                controller: controller.questionController,
              ),
              SizedBox(height: Get.height / 20),
              MoreItems(controller: controller),
              SizedBox(height: Get.height / 24),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreItems extends StatelessWidget {
  const MoreItems({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AddNewFlashCardController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Column(children: [
          TextButton(
            onPressed: () {
              controller.isExpanded.value == false
                  ? controller.isExpanded.value = true
                  : controller.isExpanded.value = false;
              controller.update();
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: controller.isExpanded.value == false
                  ? Row(
                      children: const [
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: DarkThemeColors.alertDialogTitleColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'More Items',
                          style: TextStyle(
                            color: DarkThemeColors.alertDialogTitleColor,
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.arrow_circle_up,
                            color: DarkThemeColors.alertDialogTitleColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'More Items',
                            style: TextStyle(
                              color: DarkThemeColors.alertDialogTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          AnimatedSwitcher(
            duration: controller.isExpanded.isTrue
                ? const Duration(milliseconds: 100)
                : const Duration(milliseconds: 200),
            transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
            child: controller.isExpanded.isTrue
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderLessInput(
                            label: 'Example',
                            controller: controller.answerTitleController),
                        SizedBox(
                          height: Get.height / 42,
                        ),
                        BorderLessInput(
                            label: 'Translation',
                            controller: controller.answerController),
                        SizedBox(
                          height: Get.height / 20,
                        ),
                        Text(
                          'Flashcard Color',
                          style: Get.textTheme.bodyText1!.copyWith(
                              color: DarkThemeColors.secondaryTextColor),
                        ),
                        SizedBox(
                          height: Get.height / 40,
                        ),
                        ColorChooserItem(),
                        SizedBox(
                          height: Get.height / 16,
                        ),
                        MyElevatedButton(
                          buttonLabel: 'CREATE',
                          onTap: () {
                            bool check = false;
                            check = controller.textFiledsCheck();
                            if(check) controller.addNewFlashCard();
                          },
                        )
                      ],
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: Get.height / 16,
                      ),
                      MyElevatedButton(
                        buttonLabel: 'CREATE',
                        onTap: () {
                          bool check = false ;
                          check = controller.textFiledsCheck();
                          if(check) controller.addNewFlashCard();
                        },
                      )
                    ],
                  ),
          ),
        ]);
      },
    );
  }
}

class ColorChooserItem extends StatelessWidget {
  ColorChooserItem({
    Key? key,
  }) : super(key: key);
  final AddNewFlashCardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Container(
            alignment: Alignment.center,
            width: controller.selectedIndex.value == 1 ? 38 : 37,
            height: controller.selectedIndex.value == 1 ? 38 : 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: controller.selectedIndex.value == 1
                    ? Colors.white
                    : DarkThemeColors.inActiveContainerBorder),
            child: ColorContainer(
              color: DarkThemeColors.lightBlue,
              onTap: () {
                controller.selectedIndex.value = 1;
                controller.color = DarkThemeColors.lightBlue;
              },
            ),
          ),
        ),
        Obx(
          () => Container(
            alignment: Alignment.center,
            width: controller.selectedIndex.value == 2 ? 38 : 37,
            height: controller.selectedIndex.value == 2 ? 38 : 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: controller.selectedIndex.value == 2
                    ? Colors.white
                    : DarkThemeColors.inActiveContainerBorder),
            child: ColorContainer(
              color: DarkThemeColors.lightYellow,
              onTap: () {
                controller.selectedIndex.value = 2;
                controller.color = DarkThemeColors.lightYellow;
              },
            ),
          ),
        ),
        Obx(
          () => Container(
            alignment: Alignment.center,
            width: controller.selectedIndex.value == 3 ? 38 : 37,
            height: controller.selectedIndex.value == 3 ? 38 : 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: controller.selectedIndex.value == 3
                    ? Colors.white
                    : DarkThemeColors.inActiveContainerBorder),
            child: ColorContainer(
              color: DarkThemeColors.lightPurple,
              onTap: () {
                controller.selectedIndex.value = 3;
                controller.color = DarkThemeColors.lightPurple;
              },
            ),
          ),
        ),
        Obx(
          () => Container(
            alignment: Alignment.center,
            width: controller.selectedIndex.value == 4 ? 38 : 37,
            height: controller.selectedIndex.value == 4 ? 38 : 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: controller.selectedIndex.value == 4
                    ? Colors.white
                    : DarkThemeColors.inActiveContainerBorder),
            child: ColorContainer(
              color: DarkThemeColors.white,
              onTap: () {
                controller.selectedIndex.value = 4;
                controller.color = DarkThemeColors.white;
              },
            ),
          ),
        ),
        Obx(
          () => Container(
            alignment: Alignment.center,
            width: controller.selectedIndex.value == 5 ? 38 : 37,
            height: controller.selectedIndex.value == 5 ? 38 : 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: controller.selectedIndex.value == 5
                    ? Colors.white
                    : DarkThemeColors.inActiveContainerBorder),
            child: ColorContainer(
              color: DarkThemeColors.lightGreen,
              onTap: () {
                controller.selectedIndex.value = 5;
                controller.color = DarkThemeColors.lightGreen;
              },
            ),
          ),
        ),
        Obx(
          () => Container(
            alignment: Alignment.center,
            width: controller.selectedIndex.value == 6 ? 38 : 37,
            height: controller.selectedIndex.value == 6 ? 38 : 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: controller.selectedIndex.value == 6
                    ? Colors.white
                    : DarkThemeColors.inActiveContainerBorder),
            child: ColorContainer(
              color: DarkThemeColors.lightPink,
              onTap: () {
                controller.selectedIndex.value = 6;
                controller.color = DarkThemeColors.lightPink;
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ColorContainer extends StatelessWidget {
  ColorContainer({Key? key, required this.color, required this.onTap})
      : super(key: key);

  final AddNewFlashCardController controller = Get.find();
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17), color: Colors.black),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
