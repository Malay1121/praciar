import 'package:get/get.dart';

import '../controllers/project_dashboard_controller.dart';

class ProjectDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDashboardController>(
      () => ProjectDashboardController(),
    );
  }
}
