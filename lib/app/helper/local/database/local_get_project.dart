import 'package:praciar/app/helper/local/database/local_get_workspace.dart';

import '/app/helper/all_imports.dart';

Future<Map> localGetProject(
    {required String projectId, required String workspaceId}) async {
  List projectList =
      (await localGetWorkspace(workspaceId: workspaceId))["projects"];
  Map output = {};
  for (var project in projectList) {
    if (projectId == project["id"]) {
      output = project;
    }
  }
  return output;
}
