// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ColorsStruct extends FFFirebaseStruct {
  ColorsStruct({
    String? colorName,
    String? colorHex,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _colorName = colorName,
        _colorHex = colorHex,
        super(firestoreUtilData);

  // "colorName" field.
  String? _colorName;
  String get colorName => _colorName ?? '';
  set colorName(String? val) => _colorName = val;

  bool hasColorName() => _colorName != null;

  // "colorHex" field.
  String? _colorHex;
  String get colorHex => _colorHex ?? '';
  set colorHex(String? val) => _colorHex = val;

  bool hasColorHex() => _colorHex != null;

  static ColorsStruct fromMap(Map<String, dynamic> data) => ColorsStruct(
        colorName: data['colorName'] as String?,
        colorHex: data['colorHex'] as String?,
      );

  static ColorsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ColorsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'colorName': _colorName,
        'colorHex': _colorHex,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'colorName': serializeParam(
          _colorName,
          ParamType.String,
        ),
        'colorHex': serializeParam(
          _colorHex,
          ParamType.String,
        ),
      }.withoutNulls;

  static ColorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorsStruct(
        colorName: deserializeParam(
          data['colorName'],
          ParamType.String,
          false,
        ),
        colorHex: deserializeParam(
          data['colorHex'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ColorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorsStruct &&
        colorName == other.colorName &&
        colorHex == other.colorHex;
  }

  @override
  int get hashCode => const ListEquality().hash([colorName, colorHex]);
}

ColorsStruct createColorsStruct({
  String? colorName,
  String? colorHex,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ColorsStruct(
      colorName: colorName,
      colorHex: colorHex,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ColorsStruct? updateColorsStruct(
  ColorsStruct? colors, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    colors
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addColorsStructData(
  Map<String, dynamic> firestoreData,
  ColorsStruct? colors,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (colors == null) {
    return;
  }
  if (colors.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && colors.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final colorsData = getColorsFirestoreData(colors, forFieldValue);
  final nestedData = colorsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = colors.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getColorsFirestoreData(
  ColorsStruct? colors, [
  bool forFieldValue = false,
]) {
  if (colors == null) {
    return {};
  }
  final firestoreData = mapToFirestore(colors.toMap());

  // Add any Firestore field values
  colors.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getColorsListFirestoreData(
  List<ColorsStruct>? colorss,
) =>
    colorss?.map((e) => getColorsFirestoreData(e, true)).toList() ?? [];
