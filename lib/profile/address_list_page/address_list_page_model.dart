import '/components/square_leading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/address_list_item/address_list_item_widget.dart';
import '/index.dart';
import 'address_list_page_widget.dart' show AddressListPageWidget;
import 'package:flutter/material.dart';

class AddressListPageModel extends FlutterFlowModel<AddressListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AddressListItem component.
  late AddressListItemModel addressListItemModel;
  // Model for SquareLeading component.
  late SquareLeadingModel squareLeadingModel;

  @override
  void initState(BuildContext context) {
    addressListItemModel = createModel(context, () => AddressListItemModel());
    squareLeadingModel = createModel(context, () => SquareLeadingModel());
  }

  @override
  void dispose() {
    addressListItemModel.dispose();
    squareLeadingModel.dispose();
  }
}
