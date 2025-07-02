import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_data.dart';

import '../create/local_write_data.dart';

Future<Map> localUpdateTask(
    {required String projectId,
    required String taskListId,
    required String taskId,
    required Map taskData}) async {
  Map data = await localReadData();
  int workspaceIndex = (data["workspaces"] as List)
      .indexWhere((element) => element["id"] == Utils.currentWorkspace);
  int projectIndex = (data["workspaces"][workspaceIndex]["projects"] as List)
      .indexWhere((element) => element["id"] == projectId);
  int taskListIndex = (data["workspaces"][workspaceIndex]["projects"]
          [projectIndex]["task_list"] as List)
      .indexWhere((element) => element["id"] == taskListId);
  int taskIndex = (data["workspaces"][workspaceIndex]["projects"][projectIndex]
          ["task_list"][taskListIndex]["tasks"] as List)
      .indexWhere((element) => element["id"] == taskId);
  data["workspaces"][workspaceIndex]["projects"][projectIndex]["task_list"]
      [taskListIndex]["tasks"][taskIndex] = taskData;
  await localWriteData(data);
  return taskData;
}
