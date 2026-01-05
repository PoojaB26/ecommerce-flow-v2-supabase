import '/flutter_flow/flutter_flow_util.dart';
import 'product_option_widget.dart' show ProductOptionWidget;
import 'package:flutter/material.dart';

class ProductOptionModel extends FlutterFlowModel<ProductOptionWidget> {
  ///  Local state fields for this component.

  bool isSelected = false;

  int quantity = 1;

  String? selectedSize;

  Color? selectedColor;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future onSizeOptionSelected(
    BuildContext context, {
    required int? index,
  }) async {
    selectedSize = widget!.sizeValues?.elementAtOrNull(index!);
  }
}
