// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TaxesStruct extends FFFirebaseStruct {
  TaxesStruct({
    double? percentage,
    double? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _percentage = percentage,
        _amount = amount,
        super(firestoreUtilData);

  // "percentage" field.
  double? _percentage;
  double get percentage => _percentage ?? 0.0;
  set percentage(double? val) => _percentage = val;

  void incrementPercentage(double amount) => percentage = percentage + amount;

  bool hasPercentage() => _percentage != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static TaxesStruct fromMap(Map<String, dynamic> data) => TaxesStruct(
        percentage: castToType<double>(data['percentage']),
        amount: castToType<double>(data['amount']),
      );

  static TaxesStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaxesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'percentage': _percentage,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'percentage': serializeParam(
          _percentage,
          ParamType.double,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static TaxesStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaxesStruct(
        percentage: deserializeParam(
          data['percentage'],
          ParamType.double,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TaxesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaxesStruct &&
        percentage == other.percentage &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([percentage, amount]);
}

TaxesStruct createTaxesStruct({
  double? percentage,
  double? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaxesStruct(
      percentage: percentage,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TaxesStruct? updateTaxesStruct(
  TaxesStruct? taxes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    taxes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTaxesStructData(
  Map<String, dynamic> firestoreData,
  TaxesStruct? taxes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (taxes == null) {
    return;
  }
  if (taxes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && taxes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taxesData = getTaxesFirestoreData(taxes, forFieldValue);
  final nestedData = taxesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = taxes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTaxesFirestoreData(
  TaxesStruct? taxes, [
  bool forFieldValue = false,
]) {
  if (taxes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(taxes.toMap());

  // Add any Firestore field values
  taxes.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaxesListFirestoreData(
  List<TaxesStruct>? taxess,
) =>
    taxess?.map((e) => getTaxesFirestoreData(e, true)).toList() ?? [];
