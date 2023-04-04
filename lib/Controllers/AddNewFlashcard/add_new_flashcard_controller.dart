import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNewFlashCardController extends GetxController{
  final RxBool isExpanded = false.obs;
  final RxBool isSelected = false.obs;
  final RxInt selectedIndex = 1.obs;
  late  Color color ;
  final TextEditingController wordController = TextEditingController();
  final TextEditingController translateController = TextEditingController();
  final TextEditingController exampleController = TextEditingController();
  final TextEditingController exampleTranslationController = TextEditingController();
}