import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';

class RegisterController extends GetxController {
  RxBool isLogin = false.obs;
  RxBool isRegister = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final RxBool codeSent = false.obs;
  final RxBool canSendAgain = true.obs;
  final RxInt sendAgainTimer = 59.obs;
  Timer? timer;

  FocusNode emailFocusNode = FocusNode();
  FocusNode codeFocusNode = FocusNode();

  @override
  void onInit() {
    isRegister.value = true;
    super.onInit();
  }

  void submit() {
    if (!EasyLoading.isShow) {
      if (isRegister.value == true) {
        // register();
      } else {
        start();
      }
    }
  }

  void register() async {
    // if (codeController.text.length != 4) {
    //   ViewUtils.showErrorDialog(
    //     "لطفا کد تایید را به صورت کامل وارد کنید (۴ رقم)",
    //   );
    //   return;
    // }
    EasyLoading.show();
    ApiResult result = await RequestsUtil.instance.auth.validate(
      email: emailController.text,
      code: codeController.text,
    );

    EasyLoading.dismiss();
    if (result.isDone) {
      Get.offAndToNamed(Routes.userInfo.name);
    } else {
      Get.snackbar('Error', result.data.toString());
    }
  }

  void sendAgain() {}

  void start() async {
    EasyLoading.show();
    ApiResult result = await RequestsUtil.instance.auth.init(
      email: emailController.text,
    );
    EasyLoading.dismiss();
    if (result.isDone) {
      isLogin.value = result.data['type'] == 'login';
      // if (isLogin.value) {
      //   passwordNode.requestFocus();
      // }
      isRegister.value = result.data['type'] == 'register';
      if (isRegister.value == true) {
        codeFocusNode.requestFocus();
        setTimer();
      }
      // ViewUtils.showSuccessDialog(
      //   result.data?['message'],
      //   time: 1,
      // );
    } else {
      Get.snackbar('Error', '${result.data?['message'].toString()}');
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
  void onClose() {
    close();
    super.onClose();
  }

  void close() {
    isRegister.value = false;

    timer?.cancel();
    emailController.clear();
    codeController.clear();
    codeController.clear();
  }
}
