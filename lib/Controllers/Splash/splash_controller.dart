import 'dart:ffi';

import 'package:get/get.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';

class SplashController extends GetxController {
  auth() async {
    ApiResult result = await RequestsUtil.instance.auth.check();
    if (result.isDone) {
      Get.snackbar('Hi', 'Welcome back !');
      Get.offAndToNamed(Routes.home.name);
      return true;
      // close();
    } else {
      Get.snackbar('Auth Error', result.data['message']);
      return false;
    }
  }

  @override
  void onInit() async {
    auth()
        ? Future.delayed(const Duration(seconds: 3)).then(
            (value) {
              Get.offAndToNamed(Routes.home.name);
            },
          )
        : Future.delayed(const Duration(seconds: 3)).then(
            (value) {
              Get.offAndToNamed(Routes.login.name);
            },
          );
    super.onInit();
  }
}
