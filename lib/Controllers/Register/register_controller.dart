import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final RxBool codeSent = false.obs;
  final RxBool canSendAgain = true.obs;
  final RxInt sendAgainTimer = 59.obs;
  Timer? timer;

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
}
