import 'package:praciar/app/helper/all_imports.dart';

@immutable
abstract class DocumentReference<T extends Object?> {
  /// The Firestore instance associated with this document reference.
  LocalFirestore get firestore;

  /// This document's given ID within the collection.
  // String get id;

  /// The parent [CollectionReference] of this document.
  // CollectionReference<T> get parent;

  /// A string representing the path of the referenced document (relative to the
  /// root of the database).
  // String get path;

  /// Gets a [CollectionReference] instance that refers to the collection at the
  /// specified path, relative from this [DocumentReference].
  CollectionReference<Map<String, dynamic>> collection(String collectionPath);

  /// Deletes the current document from the collection.
  // Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// Objects key can be a String or a FieldPath.
  ///
  /// If no document exists yet, the update will fail.
  // Future<void> update(Map<Object, Object?> data);

  /// Reads the document referenced by this [DocumentReference].
  ///
  /// By providing [options], this method can be configured to fetch results only
  /// from the server, only from the local cache or attempt to fetch results
  /// from the server and fall back to the cache (which is the default).
  Future<LocalDocumentSnapshot> get();

  /// Notifies of document updates at this location.
  ///
  /// An initial event is immediately sent, and further events will be
  /// sent whenever the document is modified.
  // Stream<DocumentSnapshot<T>> snapshots({
  //   bool includeMetadataChanges = false,
  //   ListenSource source = ListenSource.defaultSource,
  // });

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  // Future<void> set(T data, [SetOptions? options]);

  /// Transforms a [DocumentReference] to manipulate a custom object instead
  /// of a `Map<String, dynamic>`.
  ///
  /// This makes both read and write operations type-safe.
  ///
  /// ```dart
  /// final modelRef = FirebaseFirestore
  ///     .instance
  ///     .collection('models')
  ///     .doc('123')
  ///     .withConverter<Model>(
  ///       fromFirestore: (snapshot, _) => Model.fromJson(snapshot.data()!),
  ///       toFirestore: (model, _) => model.toJson(),
  ///     );
  ///
  /// Future<void> main() async {
  ///   // Writes now take a Model as parameter instead of a Map
  ///   await modelRef.set(Model());
  ///
  ///   // Reads now return a Model instead of a Map
  ///   final Model model = await modelRef.get().then((s) => s.data());
  /// }
  /// ```
//   DocumentReference<R> withConverter<R>({
//     required FromFirestore<R> fromFirestore,
//     required ToFirestore<R> toFirestore,
//   });
}

//
class JsonDocumentReference implements DocumentReference<Map<String, dynamic>> {
  JsonDocumentReference(
    this.firestore,
    this.path,
    this.delegate,
  ) {}
  LocalDelegate delegate;
  @override
  final String path;
  @override
  final LocalFirestore firestore;
//
//   @override
//   String get id => _delegate.id;
//
//   @override
//   CollectionReference<Map<String, dynamic>> get parent =>
//       JsonCollectionReference(firestore, _delegate.parent);
//
//   @override
//   String get path => _delegate.path;

  @override
  CollectionReference<Map<String, dynamic>> collection(String collectionPath) {
    assert(
      collectionPath.isNotEmpty,
      'a collectionPath path must be a non-empty string',
    );
    assert(
      !collectionPath.contains('//'),
      'a collection path must not contain "//"',
    );
    print(collectionPath);
    delegate.collection(collectionPath);
    return JsonCollectionReference(firestore, collectionPath, delegate);
  }

  // @override
  // Future<void> delete() => _delegate.delete();
  //
  @override
  Future<LocalDocumentSnapshot> get() async {
    return LocalDocumentSnapshot(firestore: firestore, delegate: delegate);
  }
  //
  // @override
  // Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots({
  //   bool includeMetadataChanges = false,
  //   ListenSource source = ListenSource.defaultSource,
  // }) {
  //   if (source == ListenSource.cache &&
  //       defaultTargetPlatform == TargetPlatform.windows) {
  //     throw UnimplementedError(
  //       'Listening from cache is not supported on Windows',
  //     );
  //   }
  //
  //   return _delegate
  //       .snapshots(includeMetadataChanges: includeMetadataChanges)
  //       .map(
  //         (delegateSnapshot) =>
  //             _JsonDocumentSnapshot(firestore, delegateSnapshot),
  //       );
  // }
  //
  // @override
  // Future<void> set(Map<String, dynamic> data, [SetOptions? options]) {
  //   return _delegate.set(
  //     _CodecUtility.replaceValueWithDelegatesInMap(data)!,
  //     options,
  //   );
  // }
  //
  // @override
  // Future<void> update(Map<Object, Object?> data) {
  //   return _delegate
  //       .update(_CodecUtility.replaceValueWithDelegatesInMapFieldPath(data)!);
  // }
  //
  // @override
  // DocumentReference<T> withConverter<T>({
  //   required FromFirestore<T> fromFirestore,
  //   required ToFirestore<T> toFirestore,
  // }) {
  //   return _WithConverterDocumentReference(this, fromFirestore, toFirestore);
  // }
  //
  // @override
  // bool operator ==(Object other) =>
  //     other is DocumentReference &&
  //     other.firestore == firestore &&
  //     other.path == path;
  //
  // @override
  // int get hashCode => Object.hash(firestore, path);

  // @override
  // String toString() => 'DocumentReference<Map<String, dynamic>>($path)';
}
