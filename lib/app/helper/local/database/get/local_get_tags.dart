import '/app/helper/all_imports.dart';

Future<List> localGetTags() async {
  return await run(() async {
    List tags = Utils.getKey((await localReadData()), ["tags"], []);

    return tags;
  });
}
