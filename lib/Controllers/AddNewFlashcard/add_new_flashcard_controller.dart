import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Models/Home/english_data_model.dart';

class AddNewFlashCardController extends GetxController{
  final RxBool isExpanded = false.obs;
  final RxBool isSelected = false.obs;
  final RxInt selectedIndex = 1.obs;
  late  Color color ;
  final TextEditingController wordController = TextEditingController();
  final TextEditingController translateController = TextEditingController();
  // late final EnglishCardsDataEntity newItem ;

}