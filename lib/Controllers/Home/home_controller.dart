import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxBool hasText = false.obs ;
  late RxInt translateIndex = 0.obs ;
  RxBool isEnglish = true.obs;
  final TextEditingController appBarSearchController = TextEditingController();
  RxList flashCardsPhraseList =[].obs;
  RxList flashCardsMeaningList = [].obs;
  void changeLanguage (String lang){
    var locale = Locale(lang);
    Get.updateLocale(locale);
  }
  // final RxInt itemIndex = 0.obs;
  final PageController pageController = PageController();

}