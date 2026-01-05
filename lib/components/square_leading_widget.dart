import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'square_leading_model.dart';
export 'square_leading_model.dart';

class SquareLeadingWidget extends StatefulWidget {
  const SquareLeadingWidget({
    super.key,
    required this.onTap,
  });

  final Future Function()? onTap;

  @override
  State<SquareLeadingWidget> createState() => _SquareLeadingWidgetState();
}

class _SquareLeadingWidgetState extends State<SquareLeadingWidget> {
  late SquareLeadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SquareLeadingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 6.0),
      child: SafeArea(
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onTap?.call();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
