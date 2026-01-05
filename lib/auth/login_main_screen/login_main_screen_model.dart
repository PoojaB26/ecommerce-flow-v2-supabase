import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_main_screen_widget.dart' show LoginMainScreenWidget;
import 'package:flutter/material.dart';

class LoginMainScreenModel extends FlutterFlowModel<LoginMainScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
