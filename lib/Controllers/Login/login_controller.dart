import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Home/home_controller.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';
import 'package:getx_flashcard/Utils/Api/storage_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';

class LoginScreenController extends GetxController {
  final RxBool isForgot = false.obs;
  final RxBool isLogin = false.obs;
  final RxBool isRegister = false.obs;
  final RxBool canSendAgain = false.obs;
  RxInt sendAgainTimer = 59.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Timer? timer;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  String refer = Routes.home.name;

  void login() async {
    if (passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your password',
      );
      return;
    }
    // EasyLoading.show();

    ApiResult result = await RequestsUtil.instance.auth.login(
      email: emailController.text,
      password: passwordController.text,
    );
    EasyLoading.dismiss();
    if (result.isDone) {
      Get.snackbar('Hi', 'Welcome to FlashCard !');
      // FocusScope.of(context).requestFocus(FocusNode());
      await StorageUtils.setToken(result.data['token']);

      // Globals.userStream.changeUser(UserModel.fromJson(
      //   result.data['user'],
      // ));
      Future.delayed(const Duration(seconds: 3), () {
        toMainPage();
      });
    } else {
      Get.snackbar(
        'Error',
        result.data.toString(),
      );
    }
  }

  void toMainPage() async {
    bool test = Get.isRegistered<HomeController>();
    if (test) {
      HomeController controller = Get.find<HomeController>();
      // controller.currentIndex = 0;
      controller.update();
    } else {
      Get.offAllNamed(
        Routes.home.name,
      );
      if (refer != Routes.home.name) {
        Get.toNamed(
          refer,
        );
      }
    }
  }

  void forgotPassword() async {
    EasyLoading.show();
    ApiResult result = await RequestsUtil.instance.auth.forgotPassword(
      email: emailController.text,
    );
    EasyLoading.dismiss();

    if (result.isDone) {
      isForgot.value = true;
      // codeFocusNode.requestFocus();
      isLogin.value = false;
      isRegister.value = false;
      setTimer();
    } else {
      Get.snackbar(
        'Error',
        result.data['message'],
      );
    }
  }

  void setTimer() async {
    canSendAgain.value = false;
    sendAgainTimer.value = 59;
    if (timer?.isActive == true) {
      timer?.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      sendAgainTimer.value = 59 - timer.tick;
      if (sendAgainTimer.value == 0) {
        canSendAgain.value = true;
        this.timer?.cancel();
      }
    });
  }

  @override
  void onInit() {
    refer = Get.parameters['refer'] ?? Routes.home.name;
    print(refer);

    super.onInit();
  }

  void close() {
    isForgot.value = false;
    isRegister.value = false;
    isLogin.value = false;
    passwordController.clear();
  }
}
