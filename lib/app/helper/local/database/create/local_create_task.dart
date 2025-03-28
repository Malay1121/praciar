import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';
import 'package:praciar/app/helper/local/database/update/local_update_project.dart';

Future<List> localCreateTask(
    String workspaceId, String projectId, String listId, Map task) async {
  return await run(() async {
    Map data = (await localGetProject(
      projectId: projectId,
      workspaceId: workspaceId,
    ))
        .first;
    List updatedTags = data["task_list"]
        .firstWhere((element) => element["id"] == listId)["tasks"]
        .add(task);
    await localUpdateProject(projectId: projectId, projectData: data);
    return data["task_list"];
  });
}
