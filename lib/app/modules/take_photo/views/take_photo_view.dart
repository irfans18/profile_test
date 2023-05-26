import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/take_photo_controller.dart';

class TakePhotoView extends GetView<TakePhotoController> {
  const TakePhotoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TakePhotoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TakePhotoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
