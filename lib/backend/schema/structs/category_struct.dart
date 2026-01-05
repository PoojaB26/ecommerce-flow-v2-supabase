// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoryStruct extends FFFirebaseStruct {
  CategoryStruct({
    String? categoryName,
    String? categoryImg,
    int? itemCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryName = categoryName,
        _categoryImg = categoryImg,
        _itemCount = itemCount,
        super(firestoreUtilData);

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;

  bool hasCategoryName() => _categoryName != null;

  // "categoryImg" field.
  String? _categoryImg;
  String get categoryImg => _categoryImg ?? '';
  set categoryImg(String? val) => _categoryImg = val;

  bool hasCategoryImg() => _categoryImg != null;

  // "itemCount" field.
  int? _itemCount;
  int get itemCount => _itemCount ?? 0;
  set itemCount(int? val) => _itemCount = val;

  void incrementItemCount(int amount) => itemCount = itemCount + amount;

  bool hasItemCount() => _itemCount != null;

  static CategoryStruct fromMap(Map<String, dynamic> data) => CategoryStruct(
        categoryName: data['categoryName'] as String?,
        categoryImg: data['categoryImg'] as String?,
        itemCount: castToType<int>(data['itemCount']),
      );

  static CategoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'categoryName': _categoryName,
        'categoryImg': _categoryImg,
        'itemCount': _itemCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoryName': serializeParam(
          _categoryName,
          ParamType.String,
        ),
        'categoryImg': serializeParam(
          _categoryImg,
          ParamType.String,
        ),
        'itemCount': serializeParam(
          _itemCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static CategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStruct(
        categoryName: deserializeParam(
          data['categoryName'],
          ParamType.String,
          false,
        ),
        categoryImg: deserializeParam(
          data['categoryImg'],
          ParamType.String,
          false,
        ),
        itemCount: deserializeParam(
          data['itemCount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryStruct &&
        categoryName == other.categoryName &&
        categoryImg == other.categoryImg &&
        itemCount == other.itemCount;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([categoryName, categoryImg, itemCount]);
}

CategoryStruct createCategoryStruct({
  String? categoryName,
  String? categoryImg,
  int? itemCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryStruct(
      categoryName: categoryName,
      categoryImg: categoryImg,
      itemCount: itemCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoryStruct? updateCategoryStruct(
  CategoryStruct? category, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    category
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryStructData(
  Map<String, dynamic> firestoreData,
  CategoryStruct? category,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (category == null) {
    return;
  }
  if (category.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && category.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryData = getCategoryFirestoreData(category, forFieldValue);
  final nestedData = categoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = category.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryFirestoreData(
  CategoryStruct? category, [
  bool forFieldValue = false,
]) {
  if (category == null) {
    return {};
  }
  final firestoreData = mapToFirestore(category.toMap());

  // Add any Firestore field values
  category.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryListFirestoreData(
  List<CategoryStruct>? categorys,
) =>
    categorys?.map((e) => getCategoryFirestoreData(e, true)).toList() ?? [];
