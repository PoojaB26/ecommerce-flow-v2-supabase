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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> checkIfCartIdNull(String userId) async {
  // Add your function code here!

  try {
    // Initialize Supabase client (ensure Supabase is properly initialized in your app)
    final supabase = Supabase.instance.client;

    // Query the `users` table for the user's `cart_id`
    final response = await supabase
        .from('users')
        .select('cart_id')
        .eq('user_id', userId)
        .single(); // Retrieve a single user record

    // Check if `cart_id` exists and is null
    if (response['cart_id'] == null) {
      return true; // `cart_id` is null
    } else {
      return false; // `cart_id` is not null
    }
  } catch (e) {
    // Handle errors (e.g., user not found, connection issues)
    print('Error checking cart_id: $e');
    throw Exception('Failed to retrieve cart_id');
  }
}
