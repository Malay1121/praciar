import '/app/helper/all_imports.dart';

Future<Map> localGetSettings() async {
  return await run(() async {
    Map settings = Utils.getKey((await localReadData()), ["settings"], []);

    return settings;
  });
}
