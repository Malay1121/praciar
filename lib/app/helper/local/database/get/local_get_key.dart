import 'package:praciar/app/helper/all_imports.dart';

Future<dynamic> localGetKey({required List location}) async {
  return await run(() async {
    String dataPath = await Utils.dataPath();
// for (String )
    Map data = await localReadData();
    print(data);
    dynamic output = data;
    for (String key in location) {
      output = output[key];
    }
    return output;
  });
}
