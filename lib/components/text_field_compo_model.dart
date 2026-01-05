import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_compo_widget.dart' show TextFieldCompoWidget;
import 'package:flutter/material.dart';

class TextFieldCompoModel extends FlutterFlowModel<TextFieldCompoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
