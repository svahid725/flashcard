import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_flashcard/Controllers/Register/register_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';
import 'package:getx_flashcard/Widgets/borderless_textfield.dart';
import 'package:getx_flashcard/Widgets/my_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
          child: Column(
            children: [
              const Text(
                'Register Account',
                style: TextStyle(
                    fontSize: 39,
                    fontFamily: 'Satisfy',
                    color: DarkThemeColors.onBackground),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              BorderLessInput(
                  label: 'Email', controller: controller.emailController),
              Obx(
                () => controller.codeSent.isTrue
                    ? SizedBox(
                        height: Get.height / 16,
                      )
                    : const SizedBox(),
              ),
              Obx(
                () => controller.codeSent.isTrue
                    ? Column(
                        children: [
                          BorderLessInput(
                              label: 'Code',
                              onChanged: (value) {
                                print(
                                    'code text length${controller.codeController.text}');
                              },
                              controller: controller.codeController),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Resend',
                                  style: Get.textTheme.bodyText1!.copyWith(
                                      color:
                                          DarkThemeColors.alertDialogTitleColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(controller.sendAgainTimer.value.toString())
                            ],
                          )
                        ],
                      )
                    : Container(),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              GetBuilder(
                init: controller,
                builder: (controller) {
                  return MyElevatedButton(
                    buttonLabel: controller.codeSent.value == false
                        ? 'SEND CODE'
                        : controller.codeController.text.length == 4
                            ? 'CONFIRM'
                            : 'ENTER CODE',
                    onTap: () {
                      if (controller.codeSent.value == false) {
                        Get.defaultDialog(
                          title: '',
                          middleText: 'Confirmation code sent to your email.',
                          middleTextStyle: Get.textTheme.bodyText1!.copyWith(
                            color: DarkThemeColors.alertDialogTitleColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        );
                      }
                      controller.codeSent.value = true;
                      controller.setTimer();
                    },
                  );
                },
              ),
              SizedBox(
                height: Get.height / 44,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      color: DarkThemeColors.inActiveContainerBorder,
                      thickness: 1,
                      endIndent: 22,
                    ),
                  ),
                  Text(
                    'or',
                    style: TextStyle(color: DarkThemeColors.secondaryTextColor),
                  ),
                  Expanded(
                    child: Divider(
                      color: DarkThemeColors.inActiveContainerBorder,
                      thickness: 1,
                      indent: 22,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              SizedBox(
                height: Get.height / 18,
                width: Get.width - 48,
                child: ElevatedButton(
                  onPressed: () {
                    Future.delayed(const Duration(seconds: 1)).then(
                      (value) => Get.offAndToNamed(Routes.personal.name),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/icons/gmail_icon.png',
                          height: 18),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
