import 'package:praciar/app/helper/all_imports.dart';

class LocalFirestore {
  String dataPath = "";

  CollectionReference<Map<String, dynamic>> collection(String collectionPath) {
    LocalDelegate delegate = LocalDelegate(dataPath: "${Utils.dataPath}");
    delegate.collection(collectionPath);

    return JsonCollectionReference(
      this,
      collectionPath,
      delegate,
    );
  }
}
