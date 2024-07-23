import 'package:praciar/app/helper/all_imports.dart';

Future<dynamic> localUpdateKey(
    {required List location, required Map updateData}) async {
  return await run(() async {
    Map data = await localReadData();
    print(data);
    dynamic output = data;
    for (String key in location) {
      output = output[key];
    }
    for (String key in updateData.keys) {
      if (output.containsKey(key)) {
        output[key] = updateData[key];
      } else {
        output.addEntries({key: updateData[key]}.entries);
      }
    }
    return output;
  });
}
