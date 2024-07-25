import '/app/helper/all_imports.dart';

Future<Map> localReadData() async {
  return await run(() async {
    String path = await Utils.getLocalPath();
    File file = File('$path/data.json');
    return jsonDecode(await file.readAsString());
  });
}
