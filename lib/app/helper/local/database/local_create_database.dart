import '/app/helper/all_imports.dart';

void localCreateDatabase() async {
  Map blank = {};
  String path = await Utils.getLocalPath();
  File file = File('$path/data.json');
  file.writeAsString(jsonEncode(blank));
}
