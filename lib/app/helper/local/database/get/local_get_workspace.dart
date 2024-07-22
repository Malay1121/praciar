import '/app/helper/all_imports.dart';

Future<Map> localGetWorkspace({required String workspaceId}) async {
  return await run(() async {
    List workspaceList = await localGetKey(location: ["workspaces"]);
    Map output = {};
    for (var workspace in workspaceList) {
      if (workspaceId == workspace["id"]) {
        output = workspace;
      }
    }
    return output;
  });
}
