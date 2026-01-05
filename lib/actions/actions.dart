import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future addToWishlist(
  BuildContext context, {
  required String? productId,
}) async {
  // Add productId to wishlist object
  FFAppState().addToLocalWishlist(productId!);
  FFAppState().update(() {});
}
