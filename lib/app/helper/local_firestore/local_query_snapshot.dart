import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local_firestore/local_delegate.dart';

class LocalQuerySnapshot {
  LocalFirestore? firestore;
  LocalDelegate delegate;
  LocalQuerySnapshot({required this.firestore, required this.delegate});
  List<LocalDocumentSnapshot> docs() {
    return delegate.getCollection();
  }
}
