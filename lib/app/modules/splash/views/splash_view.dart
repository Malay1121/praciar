import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: Image.asset(
                AppImages.logoShort,
                width: 400.w(context),
                height: 200.h(context),
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        });
  }
}
