import '/app/helper/all_imports.dart';

Future<List> localGetWorkspace({String? workspaceId}) async {
  return await run(() async {
    List workspaceList = await localGetKey(location: ["workspaces"]);
    List output = [];
    if (workspaceId == null) {
      output = workspaceList;
    } else {
      output.addAll(workspaceList.where(
        (element) => element["id"] == workspaceId,
      ));
    }

    return output;
  });
}
