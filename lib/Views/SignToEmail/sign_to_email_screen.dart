import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Personal/sign_page_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';


class SignScreen extends StatelessWidget {
  SignScreen({Key? key}) : super(key: key);
  final PersonalScreenController controller =
      Get.put(PersonalScreenController());

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                  fontSize: 39,
                  fontFamily: 'Satisfy',
                  color: DarkThemeColors.onBackground),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please sign in to your account. You will have a personal page and Flashcards in each category.',
              style: TextStyle(
                  fontSize: 15,
                  color: DarkThemeColors.secondaryTextColor,
                  height: 1.5),
            ),
            SizedBox(height: Get.height/16),
            SizedBox(
              width: Get.width - 48,
              height: Get.height/16,
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
                child: const Text(
                  'Sign in with Google',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
