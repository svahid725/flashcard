import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Home/home_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';
import 'package:getx_flashcard/Views/AddNewFlashcard/add_new_flashcard_screen.dart';

class MyAppBar extends StatelessWidget {
  final HomeController controller = Get.find();

  MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        height: 48,
        child: Obx(
          () => TextField(
            controller: controller.appBarSearchController,
            onChanged: (value) {
              controller.hasText.value = value.isNotEmpty;
            },
            decoration: InputDecoration(
              suffixIcon: controller.hasText.isTrue
                  ? IconButton(
                      onPressed: () {
                        controller.appBarSearchController.clear();
                        controller.hasText.value = false;
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                  : const SizedBox(),
              hintText: 'Search...',
              contentPadding: const EdgeInsets.only(left: 24),
              hintStyle: const TextStyle(fontSize: 15),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff222222),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff222222),
                ),
              ),
            ),
          ),
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
                Get.toNamed(Routes.sign.name);
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
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
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
                              color: const Color(0xffACACAC).withOpacity(0.4),
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
                              color: const Color(0xffACACAC).withOpacity(0.4),
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
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
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
                  contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
                );
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                child: Text('Learning mode'),
              ),
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
    );
  }
}
