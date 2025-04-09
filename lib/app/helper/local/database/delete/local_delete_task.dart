import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_project.dart';

import '../create/local_write_data.dart';

Future<List> localDeleteTask(
    String workspaceId, String projectId, String listId, String taskId) async {
  return await run(() async {
    Map data = (await localGetProject(
      projectId: projectId,
      workspaceId: workspaceId,
    ))
        .first;
    data["task_list"]
        .firstWhere((element) => element["id"] == listId)["tasks"]
        .removeWhere((element) => taskId == element["id"]);
    await localUpdateProject(projectId: projectId, projectData: data);
    return data["task_list"];
  });
}
