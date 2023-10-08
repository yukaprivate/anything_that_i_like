import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final fireStoreHelperProvider = Provider<FirestoreHelper>((ref) {
  return FirestoreHelper(ref);
});

/// Firestoreのコレクション、ドキュメントのリファレンス取得のためのヘルパークラス
/// transaction、batchもラップして提供する
class FirestoreHelper {
  FirestoreHelper(this._ref): super();

  final Ref _ref;
  // FireStoreコレクションバージョン
  static const String publicFireStoreCollectionVersion = 'v1';
  static const String privateFireStoreCollectionVersion = 'v1';


  /// Firestoreのインスタンス
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  /// 現在時刻
  Timestamp get now => Timestamp.now();

  /// IDの自動生成
  String generateId() {
    return _firestore.collection('generateId').doc().id;
  }

  /// privateドキュメント
  DocumentReference get _private =>
      _firestore.collection('private').doc(privateFireStoreCollectionVersion);

  /// transaction
  Future<T> runTransaction<T>(TransactionHandler<T> transaction) {
    return _firestore.runTransaction(
      transaction,
      timeout: const Duration(seconds: 30),
    );
  }

  /// private/{version}/customersコレクション
  CollectionReference get customerCollection =>
      _private.collection('customers');
}

/// FirestoreのTimestamp型をfreezed（JSON形式）でやり取りするための変換クラス
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
          .toLocal();

  @override
  Timestamp toJson(DateTime dateTime) =>
      Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
}

/// FirestoreのDocumentReference型をfreezed（JSON形式）でやり取りするための変換クラス
class DocumentReferenceConverter
    implements JsonConverter<DocumentReference, DocumentReference> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(DocumentReference ref) => ref;

  @override
  DocumentReference toJson(DocumentReference ref) => ref;
}

/// FirestoreのGeoPoint型をfreezed（JSON形式）でやり取りするための変換クラス
class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) => geoPoint;

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}
