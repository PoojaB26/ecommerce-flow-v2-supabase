import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/cart/cart_item/cart_item_widget.dart';
import '/cart/price_summary/price_summary_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_products_component_model.dart';
export 'cart_products_component_model.dart';

class CartProductsComponentWidget extends StatefulWidget {
  const CartProductsComponentWidget({
    super.key,
    required this.updateCartStatus,
  });

  final Future Function(bool cartEmptyStatus)? updateCartStatus;

  @override
  State<CartProductsComponentWidget> createState() =>
      _CartProductsComponentWidgetState();
}

class _CartProductsComponentWidgetState
    extends State<CartProductsComponentWidget> {
  late CartProductsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartProductsComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ItemsRow>>(
      stream: _model.containerSupabaseStream ??= SupaFlow.client
          .from("items")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'cart_id',
            FFAppState().cartId,
          )
          .map((list) => list.map((item) => ItemsRow(item)).toList())
        ..listen((List<ItemsRow> containerItemsRowList) async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Cart is updated!',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );

          safeSetState(() {});
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<ItemsRow> containerItemsRowList = snapshot.data!;

        return Container(
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 6.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.updateCartStatus?.call(
                              true,
                            );
                            await actions.resetCartId(
                              FFAppState().userId,
                            );
                            FFAppState().cartItems = [];
                            safeSetState(() {});
                          },
                          child: Text(
                            'Remove All ',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final cartItemsGenerated = functions
                            .convertItemsRowstoStruct(
                                containerItemsRowList.toList())
                            .toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(cartItemsGenerated.length,
                              (cartItemsGeneratedIndex) {
                            final cartItemsGeneratedItem =
                                cartItemsGenerated[cartItemsGeneratedIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingMedium.toDouble(),
                                    0.0,
                                  ),
                                  0.0,
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingMedium.toDouble(),
                                    0.0,
                                  ),
                                  0.0),
                              child: CartItemWidget(
                                key: Key(
                                    'Keyrdy_${cartItemsGeneratedIndex}_of_${cartItemsGenerated.length}'),
                                item: cartItemsGeneratedItem,
                                itemIndex: cartItemsGeneratedIndex,
                                onDelete: (index) async {
                                  await ItemsTable().delete(
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'product_id',
                                      cartItemsGeneratedItem.productId,
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                FFAppConstants.paddingMedium.toDouble(),
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                FFAppConstants.paddingMedium.toDouble(),
                                0.0,
                              ),
                              0.0),
                          child: wrapWithModel(
                            model: _model.priceSummaryModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PriceSummaryWidget(
                              cartItems: functions.convertItemsRowstoStruct(
                                  containerItemsRowList.toList()),
                              appliedCoupon: _model.appliedCoupon,
                              totalCost: functions.calculateCartTotals(
                                  functions
                                      .convertItemsRowstoStruct(
                                          containerItemsRowList.toList())
                                      .toList(),
                                  CartPriceType.totalCost),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingLarge,
                                    0.0,
                                  ),
                                  0.0,
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingSmall.toDouble(),
                                    0.0,
                                  ),
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.percent,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'Enter Coupon Code',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.couponQuery =
                                            await queryCouponsRecordOnce(
                                          queryBuilder: (couponsRecord) =>
                                              couponsRecord.where(
                                            'code',
                                            isEqualTo:
                                                _model.textController.text,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.couponQuery?.reference !=
                                            null) {
                                          _model.appliedCoupon =
                                              _model.couponQuery;
                                          safeSetState(() {});
                                          await _model.updateTotalCost(context);
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      FFAppConstants.paddingMedium.toDouble(),
                      0.0,
                    ),
                    24.0,
                    valueOrDefault<double>(
                      FFAppConstants.paddingMedium.toDouble(),
                      0.0,
                    ),
                    24.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    // Create new orders and get order ID
                    _model.ordersResponse = await OrdersTable().insert({
                      'total_amount': _model.totalAmount,
                      'user_id': currentUserUid,
                    });
                    _model.serializedCartItems =
                        await actions.serializeCartItemsForOrders(
                      functions
                          .convertItemsRowstoStruct(
                              containerItemsRowList.toList())
                          .toList(),
                      _model.ordersResponse!.id,
                    );
                    while (_model.loopCount < containerItemsRowList.length) {
                      _model.createItemsResult =
                          await CreateOrderItemsCall.call(
                        serializedBodyJson: _model.serializedCartItems
                            ?.elementAtOrNull(_model.loopCount),
                      );

                      if (!(_model.createItemsResult?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Order failed!',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }
                      _model.loopCount = _model.loopCount + 1;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Order created!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    FFAppState().cartItems = [];
                    safeSetState(() {});

                    context.pushNamed(OrderListPageWidget.routeName);

                    await actions.resetCartId(
                      FFAppState().userId,
                    );

                    safeSetState(() {});
                  },
                  text: 'Checkout',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
