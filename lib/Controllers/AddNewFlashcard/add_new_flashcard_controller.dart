import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/Home/home_controller.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';

class AddNewFlashCardController extends GetxController {
  final RxBool isExpanded = false.obs;
  final RxBool isSelected = false.obs;
  final RxInt selectedIndex = 1.obs;
  late Color color;
  final RxBool isLoading = false.obs;
  final RxInt groupId = 1.obs;
  final RxBool isStudent = true.obs;

  final TextEditingController questionTitleController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerTitleController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  final FocusNode questionTitle = FocusNode();
  final FocusNode question = FocusNode();
  final FocusNode answerTitle = FocusNode();
  final FocusNode answer = FocusNode();

  void addNewFlashCard() async {
    // EasyLoading.show();
    ApiResult result = await RequestsUtil.instance.flashCardsApi.addFlashCard(
      groupId: groupId.value,
      questionTitle: questionTitleController.text,
      question: questionController.text,
      answerTitle: answerTitleController.text,
      answer: answerController.text,
    );
    // EasyLoading.dismiss();
    if (result.isDone) {
      Get.offAndToNamed(Routes.home.name);
      final HomeController homeController = Get.find();
      homeController.onInit();
      close();
      Get.snackbar('Done', result.data);
    } else {
      Get.snackbar('Error', result.data.toString());
    }
  }

  bool textFiledsCheck() {
    if (questionTitleController.text.isEmpty ||
        questionController.text.isEmpty) {
      Get.snackbar('Empty input', 'Please enter your expression in fields');
      return false;
    } else if (answerController.text.isEmpty ||
        answerTitleController.text.isEmpty) {
      Get.snackbar('Empty input in More items',
          'Please enter your expression in fields');
      return false;
    } else {
      return true;
    }
  }

  void close() {
    questionController.clear();
    questionTitleController.clear();
    answerController.clear();
    answerTitleController.clear();
  }
}
