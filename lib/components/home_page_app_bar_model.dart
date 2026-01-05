import '/cart/cart_counter/cart_counter_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_app_bar_widget.dart' show HomePageAppBarWidget;
import 'package:flutter/material.dart';

class HomePageAppBarModel extends FlutterFlowModel<HomePageAppBarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for CartCounter component.
  late CartCounterModel cartCounterModel;

  @override
  void initState(BuildContext context) {
    cartCounterModel = createModel(context, () => CartCounterModel());
  }

  @override
  void dispose() {
    cartCounterModel.dispose();
  }
}
