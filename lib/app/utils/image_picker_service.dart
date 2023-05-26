import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {

  Future<XFile?> cropImage({required CropAspectRatio cropAspectRatio,
    required String filePath,
    required context}) async{

      CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatio: cropAspectRatio,
      compressQuality: 90,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.page
        ),
      ],
    );
    if (croppedFile == null) return null;
    return XFile(croppedFile.path);

  }

  Future<XFile?> pickCropImage({
    required CropAspectRatio cropAspectRatio,
    required ImageSource imageSource,
    required context
  }) async {
    //Pick image
    XFile? pickImage = await ImagePicker().pickImage(source: imageSource);
    if (pickImage == null) return null;

    //Crop picked image
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickImage.path,
      aspectRatio: cropAspectRatio,
      compressQuality: 90,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.page
        ),
      ],
    );
    if (croppedFile == null) return null;
    return XFile(croppedFile.path);
  }
}
