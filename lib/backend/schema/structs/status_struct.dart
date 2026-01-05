// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusStruct extends FFFirebaseStruct {
  StatusStruct({
    OrderStatus? orderStatus,
    DeliveryStatus? deliveryStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderStatus = orderStatus,
        _deliveryStatus = deliveryStatus,
        super(firestoreUtilData);

  // "orderStatus" field.
  OrderStatus? _orderStatus;
  OrderStatus get orderStatus => _orderStatus ?? OrderStatus.pending;
  set orderStatus(OrderStatus? val) => _orderStatus = val;

  bool hasOrderStatus() => _orderStatus != null;

  // "deliveryStatus" field.
  DeliveryStatus? _deliveryStatus;
  DeliveryStatus get deliveryStatus =>
      _deliveryStatus ?? DeliveryStatus.pending;
  set deliveryStatus(DeliveryStatus? val) => _deliveryStatus = val;

  bool hasDeliveryStatus() => _deliveryStatus != null;

  static StatusStruct fromMap(Map<String, dynamic> data) => StatusStruct(
        orderStatus: data['orderStatus'] is OrderStatus
            ? data['orderStatus']
            : deserializeEnum<OrderStatus>(data['orderStatus']),
        deliveryStatus: data['deliveryStatus'] is DeliveryStatus
            ? data['deliveryStatus']
            : deserializeEnum<DeliveryStatus>(data['deliveryStatus']),
      );

  static StatusStruct? maybeFromMap(dynamic data) =>
      data is Map ? StatusStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'orderStatus': _orderStatus?.serialize(),
        'deliveryStatus': _deliveryStatus?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderStatus': serializeParam(
          _orderStatus,
          ParamType.Enum,
        ),
        'deliveryStatus': serializeParam(
          _deliveryStatus,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static StatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusStruct(
        orderStatus: deserializeParam<OrderStatus>(
          data['orderStatus'],
          ParamType.Enum,
          false,
        ),
        deliveryStatus: deserializeParam<DeliveryStatus>(
          data['deliveryStatus'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'StatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusStruct &&
        orderStatus == other.orderStatus &&
        deliveryStatus == other.deliveryStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([orderStatus, deliveryStatus]);
}

StatusStruct createStatusStruct({
  OrderStatus? orderStatus,
  DeliveryStatus? deliveryStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusStruct(
      orderStatus: orderStatus,
      deliveryStatus: deliveryStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusStruct? updateStatusStruct(
  StatusStruct? status, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    status
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusStructData(
  Map<String, dynamic> firestoreData,
  StatusStruct? status,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (status == null) {
    return;
  }
  if (status.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && status.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusData = getStatusFirestoreData(status, forFieldValue);
  final nestedData = statusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = status.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusFirestoreData(
  StatusStruct? status, [
  bool forFieldValue = false,
]) {
  if (status == null) {
    return {};
  }
  final firestoreData = mapToFirestore(status.toMap());

  // Add any Firestore field values
  status.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusListFirestoreData(
  List<StatusStruct>? statuss,
) =>
    statuss?.map((e) => getStatusFirestoreData(e, true)).toList() ?? [];
