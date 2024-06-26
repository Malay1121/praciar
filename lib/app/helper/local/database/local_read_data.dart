import '/app/helper/all_imports.dart';

Future<UserData> localReadData() async {
  String path = await Utils.getLocalPath();
  File file = File('$path/data.json');
  return UserData.fromJson(jsonDecode(await file.readAsString()));
}
