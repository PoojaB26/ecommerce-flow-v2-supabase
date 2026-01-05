import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/cart/price_summary/price_summary_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_products_component_widget.dart' show CartProductsComponentWidget;
import 'package:flutter/material.dart';

class CartProductsComponentModel
    extends FlutterFlowModel<CartProductsComponentWidget> {
  ///  Local state fields for this component.

  double totalAmount = 0.0;

  CouponsRecord? appliedCoupon;

  int loopCount = 0;

  ///  State fields for stateful widgets in this component.

  Stream<List<ItemsRow>>? containerSupabaseStream;
  // Model for PriceSummary component.
  late PriceSummaryModel priceSummaryModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  CouponsRecord? couponQuery;
  // Stores action output result for [Backend Call - Insert Row] action in CheckoutButton widget.
  OrdersRow? ordersResponse;
  // Stores action output result for [Custom Action - serializeCartItemsForOrders] action in CheckoutButton widget.
  List<dynamic>? serializedCartItems;
  // Stores action output result for [Backend Call - API (Create Order Items)] action in CheckoutButton widget.
  ApiCallResponse? createItemsResult;

  @override
  void initState(BuildContext context) {
    priceSummaryModel = createModel(context, () => PriceSummaryModel());
  }

  @override
  void dispose() {
    priceSummaryModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future updateTotalCost(BuildContext context) async {}
}
