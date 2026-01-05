// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StockStatusStruct extends FFFirebaseStruct {
  StockStatusStruct({
    int? xs,
    int? small,
    int? med,
    int? large,
    int? xl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _xs = xs,
        _small = small,
        _med = med,
        _large = large,
        _xl = xl,
        super(firestoreUtilData);

  // "XS" field.
  int? _xs;
  int get xs => _xs ?? 0;
  set xs(int? val) => _xs = val;

  void incrementXs(int amount) => xs = xs + amount;

  bool hasXs() => _xs != null;

  // "Small" field.
  int? _small;
  int get small => _small ?? 0;
  set small(int? val) => _small = val;

  void incrementSmall(int amount) => small = small + amount;

  bool hasSmall() => _small != null;

  // "Med" field.
  int? _med;
  int get med => _med ?? 0;
  set med(int? val) => _med = val;

  void incrementMed(int amount) => med = med + amount;

  bool hasMed() => _med != null;

  // "Large" field.
  int? _large;
  int get large => _large ?? 0;
  set large(int? val) => _large = val;

  void incrementLarge(int amount) => large = large + amount;

  bool hasLarge() => _large != null;

  // "XL" field.
  int? _xl;
  int get xl => _xl ?? 0;
  set xl(int? val) => _xl = val;

  void incrementXl(int amount) => xl = xl + amount;

  bool hasXl() => _xl != null;

  static StockStatusStruct fromMap(Map<String, dynamic> data) =>
      StockStatusStruct(
        xs: castToType<int>(data['XS']),
        small: castToType<int>(data['Small']),
        med: castToType<int>(data['Med']),
        large: castToType<int>(data['Large']),
        xl: castToType<int>(data['XL']),
      );

  static StockStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? StockStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'XS': _xs,
        'Small': _small,
        'Med': _med,
        'Large': _large,
        'XL': _xl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'XS': serializeParam(
          _xs,
          ParamType.int,
        ),
        'Small': serializeParam(
          _small,
          ParamType.int,
        ),
        'Med': serializeParam(
          _med,
          ParamType.int,
        ),
        'Large': serializeParam(
          _large,
          ParamType.int,
        ),
        'XL': serializeParam(
          _xl,
          ParamType.int,
        ),
      }.withoutNulls;

  static StockStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      StockStatusStruct(
        xs: deserializeParam(
          data['XS'],
          ParamType.int,
          false,
        ),
        small: deserializeParam(
          data['Small'],
          ParamType.int,
          false,
        ),
        med: deserializeParam(
          data['Med'],
          ParamType.int,
          false,
        ),
        large: deserializeParam(
          data['Large'],
          ParamType.int,
          false,
        ),
        xl: deserializeParam(
          data['XL'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StockStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StockStatusStruct &&
        xs == other.xs &&
        small == other.small &&
        med == other.med &&
        large == other.large &&
        xl == other.xl;
  }

  @override
  int get hashCode => const ListEquality().hash([xs, small, med, large, xl]);
}

StockStatusStruct createStockStatusStruct({
  int? xs,
  int? small,
  int? med,
  int? large,
  int? xl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StockStatusStruct(
      xs: xs,
      small: small,
      med: med,
      large: large,
      xl: xl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StockStatusStruct? updateStockStatusStruct(
  StockStatusStruct? stockStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stockStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStockStatusStructData(
  Map<String, dynamic> firestoreData,
  StockStatusStruct? stockStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stockStatus == null) {
    return;
  }
  if (stockStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stockStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stockStatusData =
      getStockStatusFirestoreData(stockStatus, forFieldValue);
  final nestedData =
      stockStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stockStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStockStatusFirestoreData(
  StockStatusStruct? stockStatus, [
  bool forFieldValue = false,
]) {
  if (stockStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stockStatus.toMap());

  // Add any Firestore field values
  stockStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStockStatusListFirestoreData(
  List<StockStatusStruct>? stockStatuss,
) =>
    stockStatuss?.map((e) => getStockStatusFirestoreData(e, true)).toList() ??
    [];
