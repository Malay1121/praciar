import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local_firestore/local_delegate.dart';

class LocalDocumentSnapshot {
  LocalFirestore? firestore;
  LocalDelegate delegate;
  LocalDocumentSnapshot({this.firestore, required this.delegate});
  Future<Map> data() {
    return delegate.getDoc();
  }
}
