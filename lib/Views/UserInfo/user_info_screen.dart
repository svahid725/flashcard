import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/UserInfo/user_info_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Widgets/borderless_textfield.dart';
import 'package:getx_flashcard/Widgets/my_elevated_button.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({Key? key}) : super(key: key);
  final UserInfoController controller = Get.put(UserInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
          child: Column(
            children: [
              const Text(
                'User Info',
                style: TextStyle(
                  fontSize: 39,
                  fontFamily: 'Satisfy',
                  color: DarkThemeColors.onBackground,
                ),
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              BorderLessInput(
                label: 'Name',
                controller: controller.nameController,
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              BorderLessInput(
                label: 'Last name',
                controller: controller.lastNameController,
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              BorderLessInput(
                label: 'Email',
                controller: controller.emailController,
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              BorderLessInput(
                label: 'Code',
                controller: controller.codeController,
                maxLength: 4,
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              BorderLessInput(
                  label: 'Password',
                  controller: controller.passwordController,
                  isPassword: true),
              SizedBox(
                height: Get.height / 24,
              ),
              BorderLessInput(
                label: 'Mobile',
                controller: controller.mobileController,
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              Row(
                children: [
                  const Text('Are you a teacher?'),
                  const SizedBox(
                    width: 12,
                  ),
                  Obx(
                    () => Checkbox(
                      value: controller.isStudent.value,
                      fillColor: MaterialStateProperty.all(
                        DarkThemeColors.secondaryTextColor,
                      ),
                      autofocus: true,
                      focusNode: controller.checkBoxFocusNode,
                      checkColor: DarkThemeColors.alertDialogTitleColor,
                      onChanged: (value) {
                        controller.isStudent.value = value ?? false;
                        controller.update();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              MyElevatedButton(
                buttonLabel: 'FINISH',
                onTap: () {
                  controller.completeRegister();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
