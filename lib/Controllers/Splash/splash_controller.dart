import 'package:get/get.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Get.offAndToNamed(Routes.home.name),
    );
    super.onInit();
  }
}
