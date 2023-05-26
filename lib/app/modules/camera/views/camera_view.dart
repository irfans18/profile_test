import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../controllers/camera_controller.dart';

class iCameraView extends GetView<iCameraController> {
  const iCameraView({Key? key}) : super(key: key);

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
              onTap: () => controller.redirectToChangeProfile(),
              child: Icon(
                Icons.arrow_circle_left,
                color: backgroundColor,
              ),
            ),
          ),
          Text(
            'Ambil Foto',
            style: titleTextStyle,
          )
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: outBackgroundColor,
      // appBar: _appBar(),
      body: FutureBuilder(
          future: controller.initializeCamera(),
          builder: (_, snapshot) =>
              (snapshot.connectionState == ConnectionState.done)
                  ? Center(
                      child: Container(
                      // height: height,
                      color: backgroundColor,
                      // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: controller.isWeb ? defaultWidth : double.infinity,
                      child: Column(
                        children: [
                          _appBar(),
                          Stack(children: [
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              width: 343,
                              // height: height / controller.camera.value.aspectRatio,
                              height: 579,
                              child: CameraPreview(controller.camera),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [shadow]),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 150,
                              child: InkWell(
                                onTap: () => controller.takePicture(context),
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    shape: BoxShape.circle
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                    ))
                  : const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: secondaryColor,
      //     onPressed: () => controller.takePicture()),
    );
  }
}
