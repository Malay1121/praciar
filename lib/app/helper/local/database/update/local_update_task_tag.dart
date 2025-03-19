import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_data.dart';

import '../create/local_write_data.dart';

Future<List> localUpdateTaskTag(
    String workspaceId, String projectId, Map tagData) async {
  return await run(() async {
    Map data = (await localReadData());
    Map tag =
        (await localGetTaskTags(projectId: projectId, workspaceId: workspaceId))
            .firstWhere((element) => element["id"] == tagData["id"]);
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

    Utils.getKey(data, [
      "workspaces",
    ], {});
    localUpdateKey(location: [
      "workspaces",
      Utils.getKey(data, ["workspaces"], [])
          .firstWhere((element) => element["id"] == workspaceId),
      "projects",
    ], updateData: tag);

    await localWriteData(data);
    return data["tags"];
  });
}
