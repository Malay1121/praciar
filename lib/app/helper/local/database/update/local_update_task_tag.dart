import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_data.dart';
import 'package:praciar/app/helper/local/database/update/local_update_project.dart';

import '../create/local_write_data.dart';

Future<List> localUpdateTaskTag(
    String workspaceId, String projectId, Map tagData) async {
  return await run(() async {
    Map project = (await localGetProject(
      projectId: projectId,
      workspaceId: workspaceId,
    ))
        .first;
    Map tag =
        project["tags"].firstWhere((element) => element["id"] == tagData["id"]);
    tag["name"] = tagData["name"];
    tag["color"] = tagData["color"];
    if (tag["updated_at"] is List) {
      tag["updated_at"].add(Utils.toUtc(
        DateTime.now(),
      ));
    } else {
      tag["updated_at"] = [
        Utils.toUtc(
          DateTime.now(),
        )
      ];
    }

    await localUpdateProject(projectId: projectId, projectData: project);

    return project["tags"];
  });
}
