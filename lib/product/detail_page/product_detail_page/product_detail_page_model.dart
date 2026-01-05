import '/backend/supabase/supabase.dart';
import '/cart/cart_counter/cart_counter_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product/detail_page/add_to_bag_button/add_to_bag_button_widget.dart';
import '/product/detail_page/product_option/product_option_widget.dart';
import '/index.dart';
import 'product_detail_page_widget.dart' show ProductDetailPageWidget;
import 'package:flutter/material.dart';

class ProductDetailPageModel extends FlutterFlowModel<ProductDetailPageWidget> {
  ///  Local state fields for this page.

  bool isSelected = false;

  int selectedQuantity = 1;

  String? selectedSize;

  String? selectedColorHex;

  bool itemAddedToCart = false;

  ///  State fields for stateful widgets in this page.

  // Model for CartCounter component.
  late CartCounterModel cartCounterModel;
  // Model for ProductOption component.
  late ProductOptionModel productOptionModel;
  // Model for AddToBagButton component.
  late AddToBagButtonModel addToBagButtonModel;
  // Stores action output result for [Custom Action - getIndexWhereProductIDExists] action in AddToBagButton widget.
  int? productIndex;
  // Stores action output result for [Custom Action - checkIfCartIdNull] action in AddToBagButton widget.
  bool? isCartIdNull;
  // Stores action output result for [Backend Call - Insert Row] action in AddToBagButton widget.
  CartRow? cartCreateResponse;

  @override
  void initState(BuildContext context) {
    cartCounterModel = createModel(context, () => CartCounterModel());
    productOptionModel = createModel(context, () => ProductOptionModel());
    addToBagButtonModel = createModel(context, () => AddToBagButtonModel());
  }

  @override
  void dispose() {
    cartCounterModel.dispose();
    productOptionModel.dispose();
    addToBagButtonModel.dispose();
  }
}
