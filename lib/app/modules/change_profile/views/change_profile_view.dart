import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  const ChangeProfileView({Key? key}) : super(key: key);

  _btnSave() {
    return Obx(() => Container(
          color: (controller.isEnabled.value) ? primaryColor : secondaryColor,
          height: 40,
          child: TextButton(
            onPressed: () => (controller.isEnabled.value) ? controller.redirectToHome() : {},
            child: Center(
              child: Text(
                'Simpan',
                style: primaryTextStyle.copyWith(color: (controller.isEnabled.value) ? Colors.white : const Color(0xff757575)),
          ),
        ),
      ),
    ));
  }

  _btnGallery(context) {
    return TextButton(
        onPressed: () => controller.redirectToGallery(context),
        child: Container(
          height: 40,
          width: 341,
          child: Center(
            child: Text(
              'Ambil dari Gallery',
              style: primaryTextStyle.copyWith(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              color: buttonColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [shadow]),
        ));
  }

  _btnCamera() {
    return TextButton(
        onPressed: () => controller.redirectToCamera(),
        child: Container(
          height: 40,
          width: 341,
          child: Center(
            child: Text(
              'Ambil dari kamera',
              style: primaryTextStyle.copyWith(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              color: buttonColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [shadow]),
        ));
  }

  _photoContainer() {
    return Obx(() => Container(
          margin:
              EdgeInsets.symmetric(vertical: 16, horizontal: horizontalMargin),
          width: 343,
          height: 343,
          decoration: BoxDecoration(
              color: secondaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [shadow]),
          child: (controller.image.value != "")
              ? Image.network(controller.image.value)
              : SizedBox(),
        ));
  }

  _appBar() {
    return Container(
      width: defaultWidth,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: primaryColor,
      ),
      child: Center(
          child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 18, 16, 18),
            child: InkWell(
              onTap: () => controller.redirectToHome(),
              child: Icon(
                Icons.arrow_circle_left,
                color: backgroundColor,
              ),
            ),
          ),
          Text(
            'Ganti Foto Profil',
            style: titleTextStyle,
          )
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: outBackgroundColor,
        // appBar: _appBar(),
        body: Center(
            child: Container(
          height: height,
          color: backgroundColor,
          // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: controller.isWeb ? defaultWidth : double.infinity,
          child: Column(
            children: [
              _appBar(),
              // const SizedBox(
              //   height: 56,
              // ),
              _photoContainer(),
              const SizedBox(
                height: 18,
              ),
              _btnCamera(),
              const SizedBox(
                height: 16,
              ),
              _btnGallery(context),
              const Spacer(),
              _btnSave(),
            ],
          ),
        )));
  }
}
