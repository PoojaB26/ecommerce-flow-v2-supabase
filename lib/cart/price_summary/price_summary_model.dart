import '/cart/price_line/price_line_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'price_summary_widget.dart' show PriceSummaryWidget;
import 'package:flutter/material.dart';

class PriceSummaryModel extends FlutterFlowModel<PriceSummaryWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for subtotal.
  late PriceLineModel subtotalModel;
  // Model for discount.
  late PriceLineModel discountModel;
  // Model for shippingFee.
  late PriceLineModel shippingFeeModel;
  // Model for appliedCouponCost.
  late PriceLineModel appliedCouponCostModel;
  // Model for TotalAmount.
  late PriceLineModel totalAmountModel;

  @override
  void initState(BuildContext context) {
    subtotalModel = createModel(context, () => PriceLineModel());
    discountModel = createModel(context, () => PriceLineModel());
    shippingFeeModel = createModel(context, () => PriceLineModel());
    appliedCouponCostModel = createModel(context, () => PriceLineModel());
    totalAmountModel = createModel(context, () => PriceLineModel());
  }

  @override
  void dispose() {
    subtotalModel.dispose();
    discountModel.dispose();
    shippingFeeModel.dispose();
    appliedCouponCostModel.dispose();
    totalAmountModel.dispose();
  }
}
