import '/app/helper/all_imports.dart';

Future<List> localGetPinnedProject({String? workspaceId}) async {
  return await run(() async {
    List projectList = await localGetProject(workspaceId: workspaceId);
    List finalList = [];

    for (Map project in projectList) {
      if (project["pinned"] == true) {
        finalList.add(project);
      }
    }

    return finalList;
  });
}
