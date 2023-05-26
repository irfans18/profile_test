import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:profile_test/app/routes/app_pages.dart';

import '../../../utils/image_picker_service.dart';

class iCameraController extends GetxController {
  late CameraController camera;
  var isWeb = kIsWeb;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    camera.dispose();
  }

  @override
  void dispose() {
    camera.dispose();
    super.dispose();
  }

  void redirectToChangeProfile() {
    Get.offNamed(Routes.CHANGE_PROFILE);
    // Get.back();
  }

  Future<void> initializeCamera() async {
    var cameras = await availableCameras();
    camera = CameraController(cameras.first, ResolutionPreset.medium);
    await camera.initialize();
  }

  void takePicture(context) async {
    XFile? filePath;
    try {
      var image = await camera.takePicture();
      // filePath = image.path;
      filePath = image;
    } catch (e) {
      debugPrint(e.toString());
    }

    cropPhoto(context, filePath);

    // Get.toNamed(Routes.CROP,arguments: file);
  }

  void cropPhoto(context, XFile? filePath) async {
    var imageFile = await ImagePickerService().cropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4),
        filePath: filePath!.path,
        context: context);
    var image = imageFile?.path;
    Get.offNamed(Routes.CHANGE_PROFILE, arguments: image);
    // Get.back(result: image);
  }
}
