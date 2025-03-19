import '/app/helper/all_imports.dart';

Future<List> localGetTaskTags(
    {required String workspaceId, required String projectId}) async {
  return await run(() async {
    Map project =
        (await localGetProject(workspaceId: workspaceId, projectId: projectId))
            .first;

    List tags = Utils.getKey(project, ["tags"], []);

    return tags;
  });
}
