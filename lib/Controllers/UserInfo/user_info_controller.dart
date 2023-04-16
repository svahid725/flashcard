import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';
import 'package:getx_flashcard/Utils/Api/storage_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';

class UserInfoController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final RxBool isStudent = false.obs;

  FocusNode nameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode codeFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode checkBoxFocusNode = FocusNode();

  void completeRegister() async {
    // EasyLoading.show();
    ApiResult result = await RequestsUtil.instance.auth.completeRegister(
      name: nameController.text,
      lastName: lastNameController.text,
      mobile: mobileController.text,
      code: codeController.text,
      email: emailController.text,
      password: passwordController.text,
      type: isStudent.isFalse ? 1.toString() : 2.toString(),
    );

    // EasyLoading.dismiss();
    if (result.isDone) {
      await StorageUtils.setToken(result.data['token']);
      // Globals.userStream.changeUser(
      //   UserModel.fromJson(
      //     result.data['user'],
      //   ),
      // );
      Get.offAllNamed(
        Routes.login.name,
      );
    } else {
      Get.snackbar(
        'Error',
        result.data.toString(),
      );
    }
  }
}
