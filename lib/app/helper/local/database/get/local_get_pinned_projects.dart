import '/app/helper/all_imports.dart';

Future<List> localGetPinnedProject() async {
  return await run(() async {
    List projectList =
        await localGetProject(workspaceId: Utils.currentWorkspace);
    List finalList = [];

    for (Map project in projectList) {
      if (project["pinned"] == true) {
        finalList.add(project);
      }
    }

    return finalList;
  });
}
