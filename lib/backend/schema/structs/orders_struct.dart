// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersStruct extends FFFirebaseStruct {
  OrdersStruct({
    DateTime? estimatedDeliveryDate,
    DateTime? actualDeliveryDate,
    StatusStruct? status,
    AddressStruct? shippingAddress,
    AddressStruct? billingAddress,
    String? orderDate,
    double? totalAmount,
    List<ItemsStruct>? productItems,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _estimatedDeliveryDate = estimatedDeliveryDate,
        _actualDeliveryDate = actualDeliveryDate,
        _status = status,
        _shippingAddress = shippingAddress,
        _billingAddress = billingAddress,
        _orderDate = orderDate,
        _totalAmount = totalAmount,
        _productItems = productItems,
        _id = id,
        super(firestoreUtilData);

  // "estimatedDeliveryDate" field.
  DateTime? _estimatedDeliveryDate;
  DateTime? get estimatedDeliveryDate => _estimatedDeliveryDate;
  set estimatedDeliveryDate(DateTime? val) => _estimatedDeliveryDate = val;

  bool hasEstimatedDeliveryDate() => _estimatedDeliveryDate != null;

  // "actualDeliveryDate" field.
  DateTime? _actualDeliveryDate;
  DateTime? get actualDeliveryDate => _actualDeliveryDate;
  set actualDeliveryDate(DateTime? val) => _actualDeliveryDate = val;

  bool hasActualDeliveryDate() => _actualDeliveryDate != null;

  // "status" field.
  StatusStruct? _status;
  StatusStruct get status => _status ?? StatusStruct();
  set status(StatusStruct? val) => _status = val;

  void updateStatus(Function(StatusStruct) updateFn) {
    updateFn(_status ??= StatusStruct());
  }

  bool hasStatus() => _status != null;

  // "shippingAddress" field.
  AddressStruct? _shippingAddress;
  AddressStruct get shippingAddress => _shippingAddress ?? AddressStruct();
  set shippingAddress(AddressStruct? val) => _shippingAddress = val;

  void updateShippingAddress(Function(AddressStruct) updateFn) {
    updateFn(_shippingAddress ??= AddressStruct());
  }

  bool hasShippingAddress() => _shippingAddress != null;

  // "billingAddress" field.
  AddressStruct? _billingAddress;
  AddressStruct get billingAddress => _billingAddress ?? AddressStruct();
  set billingAddress(AddressStruct? val) => _billingAddress = val;

  void updateBillingAddress(Function(AddressStruct) updateFn) {
    updateFn(_billingAddress ??= AddressStruct());
  }

  bool hasBillingAddress() => _billingAddress != null;

  // "orderDate" field.
  String? _orderDate;
  String get orderDate => _orderDate ?? '';
  set orderDate(String? val) => _orderDate = val;

  bool hasOrderDate() => _orderDate != null;

  // "totalAmount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  set totalAmount(double? val) => _totalAmount = val;

  void incrementTotalAmount(double amount) =>
      totalAmount = totalAmount + amount;

  bool hasTotalAmount() => _totalAmount != null;

  // "productItems" field.
  List<ItemsStruct>? _productItems;
  List<ItemsStruct> get productItems => _productItems ?? const [];
  set productItems(List<ItemsStruct>? val) => _productItems = val;

  void updateProductItems(Function(List<ItemsStruct>) updateFn) {
    updateFn(_productItems ??= []);
  }

  bool hasProductItems() => _productItems != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static OrdersStruct fromMap(Map<String, dynamic> data) => OrdersStruct(
        estimatedDeliveryDate: data['estimatedDeliveryDate'] as DateTime?,
        actualDeliveryDate: data['actualDeliveryDate'] as DateTime?,
        status: data['status'] is StatusStruct
            ? data['status']
            : StatusStruct.maybeFromMap(data['status']),
        shippingAddress: data['shippingAddress'] is AddressStruct
            ? data['shippingAddress']
            : AddressStruct.maybeFromMap(data['shippingAddress']),
        billingAddress: data['billingAddress'] is AddressStruct
            ? data['billingAddress']
            : AddressStruct.maybeFromMap(data['billingAddress']),
        orderDate: data['orderDate'] as String?,
        totalAmount: castToType<double>(data['totalAmount']),
        productItems: getStructList(
          data['productItems'],
          ItemsStruct.fromMap,
        ),
        id: data['id'] as String?,
      );

  static OrdersStruct? maybeFromMap(dynamic data) =>
      data is Map ? OrdersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'estimatedDeliveryDate': _estimatedDeliveryDate,
        'actualDeliveryDate': _actualDeliveryDate,
        'status': _status?.toMap(),
        'shippingAddress': _shippingAddress?.toMap(),
        'billingAddress': _billingAddress?.toMap(),
        'orderDate': _orderDate,
        'totalAmount': _totalAmount,
        'productItems': _productItems?.map((e) => e.toMap()).toList(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estimatedDeliveryDate': serializeParam(
          _estimatedDeliveryDate,
          ParamType.DateTime,
        ),
        'actualDeliveryDate': serializeParam(
          _actualDeliveryDate,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.DataStruct,
        ),
        'shippingAddress': serializeParam(
          _shippingAddress,
          ParamType.DataStruct,
        ),
        'billingAddress': serializeParam(
          _billingAddress,
          ParamType.DataStruct,
        ),
        'orderDate': serializeParam(
          _orderDate,
          ParamType.String,
        ),
        'totalAmount': serializeParam(
          _totalAmount,
          ParamType.double,
        ),
        'productItems': serializeParam(
          _productItems,
          ParamType.DataStruct,
          isList: true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrdersStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdersStruct(
        estimatedDeliveryDate: deserializeParam(
          data['estimatedDeliveryDate'],
          ParamType.DateTime,
          false,
        ),
        actualDeliveryDate: deserializeParam(
          data['actualDeliveryDate'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeStructParam(
          data['status'],
          ParamType.DataStruct,
          false,
          structBuilder: StatusStruct.fromSerializableMap,
        ),
        shippingAddress: deserializeStructParam(
          data['shippingAddress'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
        billingAddress: deserializeStructParam(
          data['billingAddress'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
        orderDate: deserializeParam(
          data['orderDate'],
          ParamType.String,
          false,
        ),
        totalAmount: deserializeParam(
          data['totalAmount'],
          ParamType.double,
          false,
        ),
        productItems: deserializeStructParam<ItemsStruct>(
          data['productItems'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrdersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrdersStruct &&
        estimatedDeliveryDate == other.estimatedDeliveryDate &&
        actualDeliveryDate == other.actualDeliveryDate &&
        status == other.status &&
        shippingAddress == other.shippingAddress &&
        billingAddress == other.billingAddress &&
        orderDate == other.orderDate &&
        totalAmount == other.totalAmount &&
        listEquality.equals(productItems, other.productItems) &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        estimatedDeliveryDate,
        actualDeliveryDate,
        status,
        shippingAddress,
        billingAddress,
        orderDate,
        totalAmount,
        productItems,
        id
      ]);
}

OrdersStruct createOrdersStruct({
  DateTime? estimatedDeliveryDate,
  DateTime? actualDeliveryDate,
  StatusStruct? status,
  AddressStruct? shippingAddress,
  AddressStruct? billingAddress,
  String? orderDate,
  double? totalAmount,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrdersStruct(
      estimatedDeliveryDate: estimatedDeliveryDate,
      actualDeliveryDate: actualDeliveryDate,
      status: status ?? (clearUnsetFields ? StatusStruct() : null),
      shippingAddress:
          shippingAddress ?? (clearUnsetFields ? AddressStruct() : null),
      billingAddress:
          billingAddress ?? (clearUnsetFields ? AddressStruct() : null),
      orderDate: orderDate,
      totalAmount: totalAmount,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrdersStruct? updateOrdersStruct(
  OrdersStruct? orders, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orders
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrdersStructData(
  Map<String, dynamic> firestoreData,
  OrdersStruct? orders,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orders == null) {
    return;
  }
  if (orders.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orders.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ordersData = getOrdersFirestoreData(orders, forFieldValue);
  final nestedData = ordersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orders.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrdersFirestoreData(
  OrdersStruct? orders, [
  bool forFieldValue = false,
]) {
  if (orders == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orders.toMap());

  // Handle nested data for "status" field.
  addStatusStructData(
    firestoreData,
    orders.hasStatus() ? orders.status : null,
    'status',
    forFieldValue,
  );

  // Handle nested data for "shippingAddress" field.
  addAddressStructData(
    firestoreData,
    orders.hasShippingAddress() ? orders.shippingAddress : null,
    'shippingAddress',
    forFieldValue,
  );

  // Handle nested data for "billingAddress" field.
  addAddressStructData(
    firestoreData,
    orders.hasBillingAddress() ? orders.billingAddress : null,
    'billingAddress',
    forFieldValue,
  );

  // Add any Firestore field values
  orders.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrdersListFirestoreData(
  List<OrdersStruct>? orderss,
) =>
    orderss?.map((e) => getOrdersFirestoreData(e, true)).toList() ?? [];
