import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Login/login_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';
import 'package:getx_flashcard/Widgets/borderless_textfield.dart';
import 'package:getx_flashcard/Widgets/my_elevated_button.dart';

class SignScreen extends StatelessWidget {
  SignScreen({Key? key}) : super(key: key);
  final LoginScreenController controller = Get.put(LoginScreenController());

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
                'Account',
                style: TextStyle(
                    fontSize: 39,
                    fontFamily: 'Satisfy',
                    color: DarkThemeColors.onBackground),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              BorderLessInput(
                label: 'Email',
                controller: controller.emailController,
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              BorderLessInput(
                label: 'Password',
                isPassword: true,
                controller: controller.passwordController,
              ),
              TextButton(
                onPressed: () {},
                child: Row(children: [
                  const Spacer(),
                  Text(
                    'Forget Paasword',
                    style: Get.textTheme.bodyText1!
                        .apply(color: DarkThemeColors.surfaceColor),
                  ),
                ]),
              ),
              SizedBox(
                height: Get.height / 16,
              ),
              MyElevatedButton(
                buttonLabel: 'FINISH',
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have any account?',
                    style: Get.textTheme.bodyText1!
                        .apply(color: DarkThemeColors.secondaryTextColor),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
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
                    backgroundColor: const MaterialStatePropertyAll(Colors.white),
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