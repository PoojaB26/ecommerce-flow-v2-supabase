import '/components/custom_input_field_widget.dart';
import '/components/square_leading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shipping_address_page_widget.dart' show ShippingAddressPageWidget;
import 'package:flutter/material.dart';

class ShippingAddressPageModel
    extends FlutterFlowModel<ShippingAddressPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CustomInputField component.
  late CustomInputFieldModel customInputFieldModel1;
  // Model for CustomInputField component.
  late CustomInputFieldModel customInputFieldModel2;
  // Model for CustomInputField component.
  late CustomInputFieldModel customInputFieldModel3;
  // Model for CustomInputField component.
  late CustomInputFieldModel customInputFieldModel4;
  // Model for SquareLeading component.
  late SquareLeadingModel squareLeadingModel;

  @override
  void initState(BuildContext context) {
    customInputFieldModel1 =
        createModel(context, () => CustomInputFieldModel());
    customInputFieldModel2 =
        createModel(context, () => CustomInputFieldModel());
    customInputFieldModel3 =
        createModel(context, () => CustomInputFieldModel());
    customInputFieldModel4 =
        createModel(context, () => CustomInputFieldModel());
    squareLeadingModel = createModel(context, () => SquareLeadingModel());
  }

  @override
  void dispose() {
    customInputFieldModel1.dispose();
    customInputFieldModel2.dispose();
    customInputFieldModel3.dispose();
    customInputFieldModel4.dispose();
    squareLeadingModel.dispose();
  }
}
