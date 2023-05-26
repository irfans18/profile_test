import 'package:get/get.dart';

import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_view.dart';
import '../modules/change_profile/bindings/change_profile_binding.dart';
import '../modules/change_profile/views/change_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/take_photo/bindings/take_photo_binding.dart';
import '../modules/take_photo/views/take_photo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PROFILE,
      page: () => const ChangeProfileView(),
      binding: ChangeProfileBinding(),
    ),
    GetPage(
      name: _Paths.TAKE_PHOTO,
      page: () => const TakePhotoView(),
      binding: TakePhotoBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => const iCameraView(),
      binding: CameraBinding(),
    ),
  ];
}
