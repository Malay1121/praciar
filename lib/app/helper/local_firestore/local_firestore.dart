import 'package:praciar/app/helper/all_imports.dart';

import 'local_collection_reference.dart';

class LocalFirestore {
  CollectionReference<Map<String, dynamic>> collection(String collectionPath) {
    print(collectionPath);
    return JsonCollectionReference(this, collectionPath);
  }
}
