import 'package:praciar/app/helper/all_imports.dart';

Future<List> localGetTaskList({
  String? workspaceId,
  String? projectId,
  String? taskListId,
}) async {
  return await run(() async {
    List taskList = [];
    List projectList =
        (await localGetProject(workspaceId: workspaceId, projectId: projectId));
    for (Map project in projectList) {
      if (taskListId != null) {
        taskList.addAll(project["task_list"].where(
          (element) => element["id"] == taskListId,
        ));
      } else {
        projectList.addAll(project["task_list"]);
      }
    }

    return taskList;
  });
}
