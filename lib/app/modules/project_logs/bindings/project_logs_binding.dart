import 'package:get/get.dart';

import '../controllers/project_logs_controller.dart';

class ProjectLogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectLogsController>(
      () => ProjectLogsController(),
    );
  }
}
