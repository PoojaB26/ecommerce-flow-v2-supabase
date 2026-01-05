import '/cart/cart_products_component/cart_products_component_widget.dart';
import '/cart/empty_cart_widget/empty_cart_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  Local state fields for this page.

  bool isCartEmpty = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkIfCartIdNull] action in CartPage widget.
  bool? userIdStatus;
  // Model for CartProductsComponent component.
  late CartProductsComponentModel cartProductsComponentModel;
  // Model for EmptyCartWidget component.
  late EmptyCartWidgetModel emptyCartWidgetModel;

  @override
  void initState(BuildContext context) {
    cartProductsComponentModel =
        createModel(context, () => CartProductsComponentModel());
    emptyCartWidgetModel = createModel(context, () => EmptyCartWidgetModel());
  }

  @override
  void dispose() {
    cartProductsComponentModel.dispose();
    emptyCartWidgetModel.dispose();
  }
}
