import "package:praciar/app/helper/all_imports.dart";
import "package:praciar/app/helper/local_firestore/local_query_snapshot.dart";

abstract class CollectionReference<T extends Object?> implements Query<T> {
  // String get id;

  /// Returns the parent [DocumentReference] of this collection or `null`.
  ///
  /// If this collection is a root collection, `null` is returned.
  // This always returns a DocumentReference even when using withConverter
  // because we do not know what is the correct type for the parent doc. @override
  // DocumentReference<Map<String, dynamic>>? get parent;

  /// A string containing the slash-separated path to this  CollectionReference
  /// (relative to the root of the database).
  // String get path;

  /// Returns a `DocumentReference` with an auto-generated ID, after
  /// populating it with provided [data].
  ///
  /// The unique key generated is prefixed with a client-generated timestamp
  /// so that the resulting list will be chronologically-sorted.
  // Future<DocumentReference<T>> add(T data);

  /// {@template cloud_firestore.collection_reference.doc}
  /// Returns a `DocumentReference` with the provided path.
  ///
  /// If no [path] is provided, an auto-generated ID is used.
  ///
  /// The unique key generated is prefixed with a client-generated timestamp
  /// so that the resulting list will be chronologically-sorted.
  /// {@endtemplate}
  DocumentReference<T> doc([String? path]);

  Future<LocalQuerySnapshot> get();

  /// Transforms a [CollectionReference] to manipulate a custom object instead
  /// of a `Map<String, dynamic>`.
  ///
  /// This makes both read and write operations type-safe.
  ///
  /// ```dart
  /// final modelsRef = FirebaseFirestore
  ///     .instance
  ///     .collection('models')
  ///     .withConverter<Model>(
  ///       fromFirestore: (snapshot, _) => Model.fromJson(snapshot.data()!),
  ///       toFirestore: (model, _) => model.toJson(),
  ///     );
  ///
  /// Future<void> main() async {
  ///   // Writes now take a Model as parameter instead of a Map
  ///   await modelsRef.add(Model());
  ///
  ///   // Reads now return a Model instead of a Map
  ///   final Model model = await modelsRef.doc('123').get().then((s) => s.data());
  /// }
  /// ```
  // `extends Object?` so that type inference defaults to `Object?` instead of `dynamic`
  // @override
  // CollectionReference<R> withConverter<R extends Object?>({
  //   required FromFirestore<R> fromFirestore,
  //   required ToFirestore<R> toFirestore,
  // });
}

@immutable
class JsonCollectionReference extends JsonQuery
    implements CollectionReference<Map<String, dynamic>> {
  JsonCollectionReference(
      LocalFirestore firestore, String collectionPath, this.delegate)
      : super(firestore, collectionPath);
  LocalDelegate delegate;
  // @override
  // String get id => _delegate.id;

  // @override
  // DocumentReference<Map<String, dynamic>>? get parent {
  //   DocumentReferencePlatform? _documentReferencePlatform = _delegate.parent;
  //
  //   // Only subcollections have a parent
  //   if (_documentReferencePlatform == null) {
  //     return null;
  //   }
  //
  //   return JsonDocumentReference(firestore, _documentReferencePlatform);
  // }
  //
  // @override
  // String get path => _delegate.path;
  //
  // @override
  // Future<DocumentReference<Map<String, dynamic>>> add(
  //   Map<String, dynamic> data,
  // ) async {
  //   final newDocument = doc();
  //   await newDocument.set(data);
  //   return newDocument;
  // }

  @override
  DocumentReference<Map<String, dynamic>> doc([String? path]) {
    if (path != null) {
      assert(path.isNotEmpty, 'a document path must be a non-empty string');
      assert(!path.contains('//'), 'a document path must not contain "//"');
      assert(path != '/', 'a document path must point to a valid document');
    }
    delegate.collection(path ?? "");

    return JsonDocumentReference(firestore, path!, delegate);
  }

  @override
  Future<LocalQuerySnapshot> get() async {
    return LocalQuerySnapshot(firestore: firestore, delegate: delegate);
  }
  // @override
  // CollectionReference<R> withConverter<R extends Object?>({
  //   required FromFirestore<R> fromFirestore,
  //   required ToFirestore<R> toFirestore,
  // }) {
  //   return _WithConverterCollectionReference(
  //     this,
  //     fromFirestore,
  //     toFirestore,
  //   );
  // }
  //
  // @override
  // bool operator ==(Object other) =>
  //     other is JsonCollectionReference &&
  //     other.runtimeType == runtimeType &&
  //     other.firestore == firestore &&
  //     other.path == path;
  //
  // @override
  // int get hashCode => Object.hash(firestore, path);

  // @override
  // String toString() => 'CollectionReference<Map<String, dynamic>>($path)';

  @override
  // TODO: implement parameters
  Map<String, dynamic> get parameters => throw UnimplementedError();

  // @override
  // // TODO: implement parameters
  // Map<String, dynamic> get parameters => throw UnimplementedError();
}
