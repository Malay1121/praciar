import 'package:get/get.dart';

import '../controllers/project_tags_controller.dart';

class ProjectTagsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectTagsController>(
      () => ProjectTagsController(),
    );
  }
}
