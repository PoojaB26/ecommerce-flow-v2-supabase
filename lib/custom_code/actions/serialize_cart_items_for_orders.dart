// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> serializeCartItemsForOrders(
    List<ItemsStruct> items, String orderId) async {
  // create a serialized items object to JSON
  List<dynamic> serializedItems = [];

  items.forEach((element) {
    Map<String, dynamic> serializedPrice = {
      "amount": element.price.amount,
      "currency": element.price.currency,
    };

    Map<String, dynamic> serializedItem = {
      "name": element.name,
      "price": serializedPrice,
      "quantity": element.quantity,
      "brand": element.brand,
      "productImg": element.productImg,
      "order_id": orderId,
      "sub_total": element.price.amount * element.quantity
    };

    serializedItems.add(serializedItem);
  });

  return serializedItems;
}
