import 'package:praciar/app/helper/all_imports.dart';

Future<List> localGetSubTask({
  String? workspaceId,
  String? projectId,
  String? taskListId,
  String? taskId,
  String? subTaskId,
}) async {
  return await run(() async {
    List subTaskList = [];
    List taskList = (await localGetTask(
        workspaceId: workspaceId,
        projectId: projectId,
        taskListId: taskListId,
        taskId: taskId));
    for (Map taskListData in taskList) {
      if (subTaskId != null) {
        subTaskList.addAll(taskListData["sub_tasks"].where(
          (element) => element["id"] == subTaskId,
        ));
      } else {
        subTaskList.addAll(taskListData["sub_tasks"]);
      }
    }

    return subTaskList;
  });
}
