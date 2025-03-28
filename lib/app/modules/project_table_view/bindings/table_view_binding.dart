import 'package:get/get.dart';

import '../controllers/project_table_view_controller.dart';

class TableViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectTableViewController>(
      () => ProjectTableViewController(),
    );
  }
}
