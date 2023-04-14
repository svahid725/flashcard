import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Models/FlashCard/flash_card_model.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';

class HomeController extends GetxController {
  RxBool hasText = false.obs;
  late RxInt translateIndex = 0.obs;
  RxBool isEnglish = true.obs;
  final RxBool isStudent = true.obs;
  final RxBool isLoading = false.obs;

  final TextEditingController appBarSearchController = TextEditingController();

  List<FlashCardsDataModel> flashCardDataModel = [];
  RxList questionTitlesList = [].obs;
  RxList questionList = [].obs;

  void changeLanguage(String lang) {
    var locale = Locale(lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    fetchFlashCards();
    // EasyLoading.isShow;
    Future.delayed(
      Duration(seconds: 2),
      () {},
    );
    // EasyLoading.dismiss();
    check();
    super.onInit();
  }

  void check() async {
    ApiResult result = await RequestsUtil.instance.auth.check();
    if (result.isDone) {
      result.data['user']['type'].toString() == 'مربی'
          ? isStudent.value = false
          : isStudent.value = true;
    } else {
      Get.snackbar('Error', result.data.toString());
    }
  }

  void fetchFlashCards() async {
    isLoading.value = true;
    ApiResult result = await RequestsUtil.instance.flashCardsApi.flashCards();
    if (result.isDone) {
      flashCardDataModel =
          FlashCardsDataModel.listFromJson(result.data['data']);
    }
    isLoading.value = false;
  }

  void getFlashCards() {
    clearListsForNewUpdate();
    for (int items = 0; items < flashCardDataModel.length; items++) {
      questionTitlesList.add(flashCardDataModel[items].questionTitle);
      questionList.add(flashCardDataModel[items].question);
    }

    questionTitlesList[translateIndex.value] =
        flashCardDataModel[translateIndex.value].answerTitle;
    questionList[translateIndex.value] =
        flashCardDataModel[translateIndex.value].answer;
  }

  void clearListsForNewUpdate() {
    questionTitlesList.value = [];
    questionList.value = [];
  }
}
