import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

import 'package:get/get.dart';
import 'package:profile_test/app/utils/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  _blueContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: horizontalMargin),
      height: 196,
      width: 341,
      decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [shadow]),
    );
  }

  _header() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: horizontalMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => controller.redirectToChangeProfile(),
            child: Container(
                    // color: secondaryColor,
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [shadow]),
                    child: (controller.image.value != "") 
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      controller.image.value,
                      height: 56,
                      width: 56,
                      fit: BoxFit.cover,
                    ))
                 : const Icon(Icons.camera_alt_outlined)
                  ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: primaryTextStyle,
              ),
              Text('Kelas 10 IPA 8', style: secondaryTextStyle)
            ],
          )
        ],
      ),
    );
  }

  _appBar() {
    return StickyWidget(
      initialPosition: StickyPosition(top: 0, left: 0),
      finalPosition: StickyPosition(top: 0, left: 0),
      controller: controller.scrollController,
      child: Container(
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
              child: Icon(
                Icons.arrow_circle_left,
                color: backgroundColor,
              ),
            ),
            Text(
              'Profile',
              style: titleTextStyle,
            )
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: outBackgroundColor,
        // appBar: _appBar(),
        body: Center(
            child: Container(
          color: backgroundColor,
          // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: controller.isWeb ? defaultWidth : double.infinity,
          child: StickyContainer(
            displayOverFlowContent: true,
            stickyChildren: [_appBar()],
            child: ListView(
              controller: controller.scrollController,
              children: [
                const SizedBox(
                  height: 56,
                ),
                _header(),
                _blueContainer(),
                _blueContainer(),
                _blueContainer(),
                _blueContainer(),
                _blueContainer(),
              ],
            ),
          ),
        )));
  }
}
