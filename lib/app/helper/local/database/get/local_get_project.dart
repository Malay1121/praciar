import '/app/helper/all_imports.dart';

Future<List> localGetProject({
  String? workspaceId,
  String? projectId,
}) async {
  return await run(() async {
    List projectList = [];
    List workspaces = (await localGetWorkspace(workspaceId: workspaceId));
    for (Map workspace in workspaces) {
      if (projectId != null) {
        projectList.addAll(workspace["projects"].where(
          (element) => element["id"] == projectId,
        ));
      } else {
        projectList.addAll(workspace["projects"]);
      }
    }

    return projectList;
  });
}
