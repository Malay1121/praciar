import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_project.dart';

import '../create/local_write_data.dart';

Future<List> localDeleteTaskTag(
    String workspaceId, String projectId, String id) async {
  return await run(() async {
    Map data = (await localGetProject(
      projectId: projectId,
      workspaceId: workspaceId,
    ))
        .first;
    data["tags"].removeWhere((element) => id == element["id"]);
    await localUpdateProject(projectId: projectId, projectData: data);
    return data["tags"];
  });
}
