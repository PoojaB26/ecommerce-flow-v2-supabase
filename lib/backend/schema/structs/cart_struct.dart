// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends FFFirebaseStruct {
  CartStruct({
    String? cartId,
    List<ItemsStruct>? items,
    ShippingOptionStruct? shippingOption,
    String? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cartId = cartId,
        _items = items,
        _shippingOption = shippingOption,
        _userId = userId,
        super(firestoreUtilData);

  // "cartId" field.
  String? _cartId;
  String get cartId => _cartId ?? '';
  set cartId(String? val) => _cartId = val;

  bool hasCartId() => _cartId != null;

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  set items(List<ItemsStruct>? val) => _items = val;

  void updateItems(Function(List<ItemsStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  // "shippingOption" field.
  ShippingOptionStruct? _shippingOption;
  ShippingOptionStruct get shippingOption =>
      _shippingOption ?? ShippingOptionStruct();
  set shippingOption(ShippingOptionStruct? val) => _shippingOption = val;

  void updateShippingOption(Function(ShippingOptionStruct) updateFn) {
    updateFn(_shippingOption ??= ShippingOptionStruct());
  }

  bool hasShippingOption() => _shippingOption != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        cartId: data['cartId'] as String?,
        items: getStructList(
          data['items'],
          ItemsStruct.fromMap,
        ),
        shippingOption: data['shippingOption'] is ShippingOptionStruct
            ? data['shippingOption']
            : ShippingOptionStruct.maybeFromMap(data['shippingOption']),
        userId: data['userId'] as String?,
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'cartId': _cartId,
        'items': _items?.map((e) => e.toMap()).toList(),
        'shippingOption': _shippingOption?.toMap(),
        'userId': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cartId': serializeParam(
          _cartId,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
        'shippingOption': serializeParam(
          _shippingOption,
          ParamType.DataStruct,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
        cartId: deserializeParam(
          data['cartId'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam<ItemsStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
        shippingOption: deserializeStructParam(
          data['shippingOption'],
          ParamType.DataStruct,
          false,
          structBuilder: ShippingOptionStruct.fromSerializableMap,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartStruct &&
        cartId == other.cartId &&
        listEquality.equals(items, other.items) &&
        shippingOption == other.shippingOption &&
        userId == other.userId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([cartId, items, shippingOption, userId]);
}

CartStruct createCartStruct({
  String? cartId,
  ShippingOptionStruct? shippingOption,
  String? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartStruct(
      cartId: cartId,
      shippingOption:
          shippingOption ?? (clearUnsetFields ? ShippingOptionStruct() : null),
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartStruct? updateCartStruct(
  CartStruct? cart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartStructData(
  Map<String, dynamic> firestoreData,
  CartStruct? cart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cart == null) {
    return;
  }
  if (cart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && cart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartData = getCartFirestoreData(cart, forFieldValue);
  final nestedData = cartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartFirestoreData(
  CartStruct? cart, [
  bool forFieldValue = false,
]) {
  if (cart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cart.toMap());

  // Handle nested data for "shippingOption" field.
  addShippingOptionStructData(
    firestoreData,
    cart.hasShippingOption() ? cart.shippingOption : null,
    'shippingOption',
    forFieldValue,
  );

  // Add any Firestore field values
  cart.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartListFirestoreData(
  List<CartStruct>? carts,
) =>
    carts?.map((e) => getCartFirestoreData(e, true)).toList() ?? [];
