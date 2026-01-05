import '/components/custom_input_field_widget.dart';
import '/components/dropdown_compo_widget.dart';
import '/components/square_leading_widget.dart';
import '/components/text_field_compo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shipping_address_page_model.dart';
export 'shipping_address_page_model.dart';

class ShippingAddressPageWidget extends StatefulWidget {
  const ShippingAddressPageWidget({super.key});

  static String routeName = 'ShippingAddressPage';
  static String routePath = '/shippingAddressPage';

  @override
  State<ShippingAddressPageWidget> createState() =>
      _ShippingAddressPageWidgetState();
}

class _ShippingAddressPageWidgetState extends State<ShippingAddressPageWidget> {
  late ShippingAddressPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingAddressPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: wrapWithModel(
            model: _model.squareLeadingModel,
            updateCallback: () => safeSetState(() {}),
            child: SquareLeadingWidget(
              onTap: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            'Shipping Address',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.roboto(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.customInputFieldModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomInputFieldWidget(
                            label: 'Full Name',
                            inputField: (String? hint) => TextFieldCompoWidget(
                              hint: 'Jane Doe',
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.customInputFieldModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomInputFieldWidget(
                            label: 'Email',
                            inputField: (String? hint) => TextFieldCompoWidget(
                              hint: 'abc@xyz.com',
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.customInputFieldModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomInputFieldWidget(
                            label: 'Street Address',
                            inputField: (String? hint) =>
                                TextFieldCompoWidget(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.customInputFieldModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomInputFieldWidget(
                            label: 'Select Country',
                            inputField: (String? hint) => DropdownCompoWidget(
                              hint: 'some hint',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Create Address',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
