// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ReviewsStruct extends FFFirebaseStruct {
  ReviewsStruct({
    String? username,
    int? rating,
    String? comment,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _rating = rating,
        _comment = comment,
        super(firestoreUtilData);

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;

  void incrementRating(int amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;

  bool hasComment() => _comment != null;

  static ReviewsStruct fromMap(Map<String, dynamic> data) => ReviewsStruct(
        username: data['username'] as String?,
        rating: castToType<int>(data['rating']),
        comment: data['comment'] as String?,
      );

  static ReviewsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReviewsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'rating': _rating,
        'comment': _comment,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReviewsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReviewsStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReviewsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReviewsStruct &&
        username == other.username &&
        rating == other.rating &&
        comment == other.comment;
  }

  @override
  int get hashCode => const ListEquality().hash([username, rating, comment]);
}

ReviewsStruct createReviewsStruct({
  String? username,
  int? rating,
  String? comment,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReviewsStruct(
      username: username,
      rating: rating,
      comment: comment,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReviewsStruct? updateReviewsStruct(
  ReviewsStruct? reviews, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    reviews
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReviewsStructData(
  Map<String, dynamic> firestoreData,
  ReviewsStruct? reviews,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (reviews == null) {
    return;
  }
  if (reviews.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && reviews.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reviewsData = getReviewsFirestoreData(reviews, forFieldValue);
  final nestedData = reviewsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = reviews.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReviewsFirestoreData(
  ReviewsStruct? reviews, [
  bool forFieldValue = false,
]) {
  if (reviews == null) {
    return {};
  }
  final firestoreData = mapToFirestore(reviews.toMap());

  // Add any Firestore field values
  reviews.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReviewsListFirestoreData(
  List<ReviewsStruct>? reviewss,
) =>
    reviewss?.map((e) => getReviewsFirestoreData(e, true)).toList() ?? [];
