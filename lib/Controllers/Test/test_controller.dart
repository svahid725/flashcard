import 'package:get/get.dart';

class TestController extends GetxController{
  final RxBool testOn = false.obs;

  @override
  void init(){
    testOn.value = true;
    super.onInit();
  }
}