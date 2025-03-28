import '/app/helper/all_imports.dart';

Future<List> localGetTaskTags(
    {required String workspaceId,
    required String projectId,
    String? tagId}) async {
  return await run(() async {
    Map project =
        (await localGetProject(workspaceId: workspaceId, projectId: projectId))
            .first;

    List tags = Utils.getKey(project, ["tags"], []);
    print("tags: $tags");
    print("tagId: $tagId");
    if (tagId != null) {
      tags = tags.where((tag) => tag["id"] == tagId).toList();
    }
    print("tags: $tags");

    return tags;
  });
}
