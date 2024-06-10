import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  static HomeSliderController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }
}