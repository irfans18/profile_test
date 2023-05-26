import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_test/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var isWeb = kIsWeb;
  late ScrollController scrollController;
  var image="".obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    image.value = (Get.arguments != null) ? Get.arguments : "";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void redirectToChangeProfile(){
    Get.offNamed(Routes.CHANGE_PROFILE);
  }
}
