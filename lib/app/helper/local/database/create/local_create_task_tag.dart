import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';
import 'package:praciar/app/helper/local/database/update/local_update_project.dart';

Future<List> localCreateTaskTag(
    String workspaceId, String projectId, Map tag) async {
  return await run(() async {
    Map data = (await localGetProject(
      projectId: projectId,
      workspaceId: workspaceId,
    ))
        .first;
    List updatedTags = Utils.addItemToList(data, ["tags"], tag);
    data.containsKey("tags")
        ? data["tags"] = updatedTags
        : data.addEntries({"tags": updatedTags}.entries);
    await localUpdateProject(projectId: projectId, projectData: data);
    return data["tags"];
  });
}
