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

Future resetCartId(String userId) async {
  // Add your function code here!

  try {
    // Initialize Supabase client
    final supabase = Supabase.instance.client;

    // Update the `users` table to set `cart_id` to null
    final response = await supabase
        .from('users')
        .update({'cart_id': null}) // Set cart_id to null
        .eq('user_id', userId); // Filter by user_id

    // Handle the response
    if (response.error != null) {
      print('Error resetting cart_id: ${response.error!.message}');
    } else {
      print('Successfully reset cart_id for user: $userId');
    }
  } catch (e) {
    print('An error occurred while resetting cart_id: $e');
  }
}
