import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/confirm_delivery_location_bottom_sheet/confirm_delivery_location_bottom_sheet_widget.dart';
import 'address_edit_page_widget.dart' show AddressEditPageWidget;
import 'package:flutter/material.dart';

class AddressEditPageModel extends FlutterFlowModel<AddressEditPageWidget> {
  ///  Local state fields for this page.

  FFPlace? place;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for ConfirmDeliveryLocationBottomSheet component.
  late ConfirmDeliveryLocationBottomSheetModel
      confirmDeliveryLocationBottomSheetModel;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {
    confirmDeliveryLocationBottomSheetModel =
        createModel(context, () => ConfirmDeliveryLocationBottomSheetModel());
  }

  @override
  void dispose() {
    confirmDeliveryLocationBottomSheetModel.dispose();
  }
}
