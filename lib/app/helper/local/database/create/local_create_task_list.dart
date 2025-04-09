import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_project.dart';

Future<List> localCreateTaskList(
    String workspaceId, String projectId, Map taskList) async {
  return await run(() async {
    Map data = (await localGetProject(
      projectId: projectId,
      workspaceId: workspaceId,
    ))
        .first;
    data["task_list"].add(taskList);
    await localUpdateProject(projectId: projectId, projectData: data);
    return Utils.getKey(data, ["task_list"], []);
  });
}
