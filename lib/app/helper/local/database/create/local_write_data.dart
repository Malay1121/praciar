import 'package:praciar/app/helper/all_imports.dart';

Future<Map> localWriteData(Map data) async {
  return await run(() async {
    String path = await Utils.getDataPath();
    File file = File('$path/data.json');
    file.writeAsString(jsonEncode(data));

    return jsonDecode(await file.readAsString());
  });
}
