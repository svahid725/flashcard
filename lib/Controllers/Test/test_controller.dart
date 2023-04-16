import 'package:get/get.dart';

class TestController extends GetxController{
  final RxBool testOn = false.obs;

  @override
  void onInit(){
    testOn.value = true;
    super.onInit();
  }
}