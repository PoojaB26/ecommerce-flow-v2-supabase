import '/flutter_flow/flutter_flow_util.dart';
import '/profile/profile_list_item/profile_list_item_widget.dart';
import '/index.dart';
import 'profile_settings_page_widget.dart' show ProfileSettingsPageWidget;
import 'package:flutter/material.dart';

class ProfileSettingsPageModel
    extends FlutterFlowModel<ProfileSettingsPageWidget> {
  ///  Local state fields for this page.

  String profileName = 'Joy Augustin';

  bool isEditMode = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ProfileListItem component.
  late ProfileListItemModel profileListItemModel1;
  // Model for ProfileListItem component.
  late ProfileListItemModel profileListItemModel2;
  // Model for ProfileListItem component.
  late ProfileListItemModel profileListItemModel3;
  // Model for ProfileListItem component.
  late ProfileListItemModel profileListItemModel4;

  @override
  void initState(BuildContext context) {
    profileListItemModel1 = createModel(context, () => ProfileListItemModel());
    profileListItemModel2 = createModel(context, () => ProfileListItemModel());
    profileListItemModel3 = createModel(context, () => ProfileListItemModel());
    profileListItemModel4 = createModel(context, () => ProfileListItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    profileListItemModel1.dispose();
    profileListItemModel2.dispose();
    profileListItemModel3.dispose();
    profileListItemModel4.dispose();
  }
}
