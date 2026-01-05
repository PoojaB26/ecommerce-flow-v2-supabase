import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_password_page_widget.dart' show LoginPasswordPageWidget;
import 'package:flutter/material.dart';

class LoginPasswordPageModel extends FlutterFlowModel<LoginPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
