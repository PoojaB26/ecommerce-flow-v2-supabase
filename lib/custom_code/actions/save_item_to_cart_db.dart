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

Future saveItemToCartDb(List<ItemsStruct> cartItems) async {
  // Add your function code here!

  try {
    // Check if the cartItems list is empty
    if (cartItems.isEmpty) {
      print('No items in the cart to save.');
      return;
    }

    // Get the last item from the cartItems list
    final lastItem = cartItems.last;

    // Initialize Supabase client
    final supabase = Supabase.instance.client;

    // Prepare the data to be inserted
    final data = {
      'cart_id': FFAppState().cartId,
      'product_id': lastItem.productId,
      'name': lastItem.name,
      'quantity': lastItem.quantity,
      'subtotal': lastItem.subtotal,
      'brand': lastItem.brand,
      'product_img': lastItem.productImg,
      'color': {
        "color_name": lastItem.color.colorName,
        "color_hex": lastItem.color.colorHex,
      }, // Assuming color is JSON-compatible
      'size': lastItem.size,
      'price': {
        "amount": lastItem.price.amount,
        "currency": lastItem.price.currency,
      }, // Assuming price is JSON-compatible
    };
    // Insert the data into the `carts` table
    final response = await supabase.from('items').insert(data);

    // Handle the response
    if (response.error != null) {
      print('Error inserting item into Supabase: ${response.error!.message}');
    } else {
      print('Last cart item saved successfully: $response');
    }
  } catch (e) {
    print('An error occurred while saving the last cart item: $e');
  }
}
