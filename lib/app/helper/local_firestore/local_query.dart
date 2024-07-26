import 'package:praciar/app/helper/local_firestore/local_firestore.dart';

import '../all_imports.dart';

@immutable
abstract class Query<T extends Object?> {
  /// The [FirebaseFirestore] instance of this query.
  LocalFirestore get firestore;

  /// Exposes the [parameters] on the query delegate.
  ///
  /// This should only be used for testing to ensure that all
  /// query modifiers are correctly set on the underlying delegate
  /// when being tested from a different package.
  Map<String, dynamic> get parameters;
}

class JsonQuery implements Query<Map<String, dynamic>> {
  JsonQuery(this.firestore, this.path) {}

  @override
  final LocalFirestore firestore;

  final String path;

  @override
  // TODO: implement parameters
  Map<String, dynamic> get parameters => throw UnimplementedError();
}
