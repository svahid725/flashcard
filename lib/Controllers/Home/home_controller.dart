import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Models/FlashCard/flash_card_model.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';

class HomeController extends GetxController {
  RxBool hasText = false.obs;
  late RxInt translateIndex = 0.obs;
  RxBool isEnglish = true.obs;
  final TextEditingController appBarSearchController = TextEditingController();
  RxList flashCardsPhraseList = [].obs;
  RxList flashCardsMeaningList = [].obs;

  void changeLanguage(String lang) {
    var locale = Locale(lang);
    Get.updateLocale(locale);
  }

  late final FlashCardModel flashCardModel;
  RxList flashCards = [].obs;
  final RxBool isLoading = true.obs;
  @override
  void onInit() {
    fetchFlashCards();
    // print(flashCardModel);
    super.onInit();
  }





  void fetchFlashCards() async {
    try {
      isLoading.value = true;
      ApiResult result =
          await RequestsUtil.instance.flashCardsApi.flashCards();

      if (result.isDone) {
        flashCardModel = FlashCardModel.fromJson(result.data);
        isLoading.value = false;
      }
      print('response :${result.data} | flashcard model : ${flashCardModel}');
    } catch (e) {
      print(e);
    }
  }
}
