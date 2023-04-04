
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/AddNewFlashcard/add_new_flashcard_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';

class MyElevatedButton extends StatelessWidget
{
  const MyElevatedButton({
    required this.buttonLabel,
    required this.onTap,
    // required this.controller,
    Key? key,
  }) : super(key: key);
  final String buttonLabel;
  // final GetxController controller;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 18,
      width: Get.width - 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          backgroundColor:
          const MaterialStatePropertyAll(DarkThemeColors.surfaceColor),
        ),
        child: Text(
          buttonLabel,
          style: Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700,color: Colors.black),
        ),
      ),
    );
  }
}