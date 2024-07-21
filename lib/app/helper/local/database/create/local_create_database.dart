import '/app/helper/all_imports.dart';

Future<bool> localFileExists() async {
  String path = await Utils.getLocalPath();
  File file = File('$path/data.json');
  return file.exists();
}

void localCreateDatabase() async {
  if (!(await localFileExists())) {
    Map blank = {};
    String path = await Utils.getLocalPath();
    File file = File('$path/data.json');
    file.writeAsString(jsonEncode(blank));
  }
}
