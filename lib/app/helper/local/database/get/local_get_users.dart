import '/app/helper/all_imports.dart';

Future<List> localGetUsers() async {
  return await run(() async {
    List users = Utils.getKey(await localReadData(), ["users"], []);

    return users;
  });
}
