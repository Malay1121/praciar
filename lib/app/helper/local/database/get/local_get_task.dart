import 'package:praciar/app/helper/all_imports.dart';

Future<List> localGetTask({
  String? workspaceId,
  String? projectId,
  String? taskListId,
  String? taskId,
}) async {
  return await run(() async {
    List taskList = [];
    List taskListList = (await localGetTaskList(
        workspaceId: workspaceId,
        projectId: projectId,
        taskListId: taskListId));
    for (Map taskListData in taskListList) {
      if (taskId != null) {
        taskList.addAll(taskListData["tasks"].where(
          (element) => element["id"] == taskId,
        ));
      } else {
        taskListList.addAll(taskListData["tasks"]);
      }
    }

    return taskList;
  });
}
