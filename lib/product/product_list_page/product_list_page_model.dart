import '/components/home_page_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'product_list_page_widget.dart' show ProductListPageWidget;
import 'package:flutter/material.dart';

class ProductListPageModel extends FlutterFlowModel<ProductListPageWidget> {
  ///  Local state fields for this page.

  String? searchString;

  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();
  // Model for HomePageAppBar component.
  late HomePageAppBarModel homePageAppBarModel;

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
    homePageAppBarModel = createModel(context, () => HomePageAppBarModel());
  }

  @override
  void dispose() {
    homePageAppBarModel.dispose();
  }
}
