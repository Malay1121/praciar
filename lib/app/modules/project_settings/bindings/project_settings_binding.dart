import 'package:get/get.dart';

import '../controllers/project_settings_controller.dart';

class ProjectSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectSettingsController>(
      () => ProjectSettingsController(),
    );
  }
}
