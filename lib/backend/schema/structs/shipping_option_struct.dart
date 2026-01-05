// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingOptionStruct extends FFFirebaseStruct {
  ShippingOptionStruct({
    String? type,
    String? estimatedDelivery,
    PriceStruct? cost,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _estimatedDelivery = estimatedDelivery,
        _cost = cost,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "estimatedDelivery" field.
  String? _estimatedDelivery;
  String get estimatedDelivery => _estimatedDelivery ?? '';
  set estimatedDelivery(String? val) => _estimatedDelivery = val;

  bool hasEstimatedDelivery() => _estimatedDelivery != null;

  // "cost" field.
  PriceStruct? _cost;
  PriceStruct get cost => _cost ?? PriceStruct();
  set cost(PriceStruct? val) => _cost = val;

  void updateCost(Function(PriceStruct) updateFn) {
    updateFn(_cost ??= PriceStruct());
  }

  bool hasCost() => _cost != null;

  static ShippingOptionStruct fromMap(Map<String, dynamic> data) =>
      ShippingOptionStruct(
        type: data['type'] as String?,
        estimatedDelivery: data['estimatedDelivery'] as String?,
        cost: data['cost'] is PriceStruct
            ? data['cost']
            : PriceStruct.maybeFromMap(data['cost']),
      );

  static ShippingOptionStruct? maybeFromMap(dynamic data) => data is Map
      ? ShippingOptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'estimatedDelivery': _estimatedDelivery,
        'cost': _cost?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'estimatedDelivery': serializeParam(
          _estimatedDelivery,
          ParamType.String,
        ),
        'cost': serializeParam(
          _cost,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ShippingOptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShippingOptionStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        estimatedDelivery: deserializeParam(
          data['estimatedDelivery'],
          ParamType.String,
          false,
        ),
        cost: deserializeStructParam(
          data['cost'],
          ParamType.DataStruct,
          false,
          structBuilder: PriceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ShippingOptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShippingOptionStruct &&
        type == other.type &&
        estimatedDelivery == other.estimatedDelivery &&
        cost == other.cost;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, estimatedDelivery, cost]);
}

ShippingOptionStruct createShippingOptionStruct({
  String? type,
  String? estimatedDelivery,
  PriceStruct? cost,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShippingOptionStruct(
      type: type,
      estimatedDelivery: estimatedDelivery,
      cost: cost ?? (clearUnsetFields ? PriceStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShippingOptionStruct? updateShippingOptionStruct(
  ShippingOptionStruct? shippingOption, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shippingOption
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShippingOptionStructData(
  Map<String, dynamic> firestoreData,
  ShippingOptionStruct? shippingOption,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shippingOption == null) {
    return;
  }
  if (shippingOption.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shippingOption.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shippingOptionData =
      getShippingOptionFirestoreData(shippingOption, forFieldValue);
  final nestedData =
      shippingOptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shippingOption.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShippingOptionFirestoreData(
  ShippingOptionStruct? shippingOption, [
  bool forFieldValue = false,
]) {
  if (shippingOption == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shippingOption.toMap());

  // Handle nested data for "cost" field.
  addPriceStructData(
    firestoreData,
    shippingOption.hasCost() ? shippingOption.cost : null,
    'cost',
    forFieldValue,
  );

  // Add any Firestore field values
  shippingOption.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShippingOptionListFirestoreData(
  List<ShippingOptionStruct>? shippingOptions,
) =>
    shippingOptions
        ?.map((e) => getShippingOptionFirestoreData(e, true))
        .toList() ??
    [];
