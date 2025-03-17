import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class ProjectDashboardController extends CommonController {
  String projectId = "";

  Future<List> getUpcomingTasks() async {
    List tasks = await DatabaseHelper.getTask(projectId: projectId);
    return TaskSorter.sortByDueDate(tasks);
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      projectId = Utils.getKey(Get.arguments, ["projectId"], "");
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
