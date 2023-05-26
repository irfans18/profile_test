import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_test/app/routes/app_pages.dart';
import 'package:profile_test/app/utils/image_picker_service.dart';

class ChangeProfileController extends GetxController {
  var isWeb = kIsWeb;
  late ScrollController scrollController;
  var image = "".obs;
  var isEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void redirectToGallery(context) async {
    var imageFile = await ImagePickerService().pickCropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4),
        imageSource: ImageSource.gallery,
        context: context);
    if (imageFile != null) {
      image.value = imageFile.path;
      isEnabled.value = true;
    }
  }

  void redirectToHome() {
    Get.offNamed(Routes.HOME, arguments: image.value);
  }

  void redirectToCamera() async {
    await Get.toNamed(Routes.CAMERA);
    var result = await Get.arguments;
    // debugPrint("TEST RESULT:"+ result);
    if (result != null) {
      image.value = result;
      isEnabled.value = true;
    }
  }
}
