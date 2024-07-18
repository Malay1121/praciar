import 'package:get/get.dart';

import '../controllers/table_view_controller.dart';

class TableViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TableViewController>(
      () => TableViewController(),
    );
  }
}
