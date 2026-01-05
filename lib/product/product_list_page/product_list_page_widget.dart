import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/home_page_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product/category/category_avatar/category_avatar_widget.dart';
import '/product/product_list_card/product_list_card_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_list_page_model.dart';
export 'product_list_page_model.dart';

/// This page is where users land after signing it.
///
/// It has search, all the categories, top selling products and more.
class ProductListPageWidget extends StatefulWidget {
  const ProductListPageWidget({super.key});

  static String routeName = 'ProductListPage';
  static String routePath = '/productListPage';

  @override
  State<ProductListPageWidget> createState() => _ProductListPageWidgetState();
}

class _ProductListPageWidgetState extends State<ProductListPageWidget> {
  late ProductListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.searchString = null;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        SingleActivator(
          LogicalKeyboardKey.keyC,
          meta: isMac,
          control: !isMac,
        ): VoidCallbackIntent(() async {
          context.pushNamed(CartPageWidget.routeName);
        }),
      },
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: Focus(
            autofocus: isShortcutsSupported,
            focusNode: _model.shortcutsFocusNode,
            child: GestureDetector(
              onTap: () {
                if (isShortcutsSupported &&
                    _model.shortcutsFocusNode.canRequestFocus) {
                  FocusScope.of(context)
                      .requestFocus(_model.shortcutsFocusNode);
                } else {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.homePageAppBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HomePageAppBarWidget(),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            30.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
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
                              child: AlignedTooltip(
                                content: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    'Search products',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                offset: 4.0,
                                preferredDirection: AxisDirection.down,
                                borderRadius: BorderRadius.circular(8.0),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                tailBaseWidth: 24.0,
                                tailLength: 12.0,
                                waitDuration: Duration(milliseconds: 100),
                                showDuration: Duration(milliseconds: 1500),
                                triggerMode: TooltipTriggerMode.longPress,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        SearchProductsPageWidget.routeName);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    FFAppConstants.paddingMedium
                                                        .toDouble(),
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
                                          child: Icon(
                                            Icons.search_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    FFAppConstants.paddingMedium
                                                        .toDouble(),
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
                                          child: Text(
                                            'Search',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: GetCategoryListCall.call(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final categoriesGetCategoryListResponse =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          FFAppConstants.paddingLarge,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          FFAppConstants.paddingLarge,
                                          0.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    FFAppConstants.paddingMedium
                                                        .toDouble(),
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Categories',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      CategoryListPageWidget
                                                          .routeName);
                                                },
                                                child: Text(
                                                  'See All',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 130.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final categoryList =
                                                    (categoriesGetCategoryListResponse
                                                                    .jsonBody
                                                                    .toList()
                                                                    .map<CategoryStruct?>(
                                                                        CategoryStruct
                                                                            .maybeFromMap)
                                                                    .toList()
                                                                as Iterable<
                                                                    CategoryStruct?>)
                                                            .withoutNulls
                                                            .toList() ??
                                                        [];

                                                return ListView.separated(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0.0,
                                                    0,
                                                    16.0,
                                                    0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      categoryList.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(
                                                          width: FFAppConstants
                                                              .paddingMedium
                                                              .toDouble()),
                                                  itemBuilder: (context,
                                                      categoryListIndex) {
                                                    final categoryListItem =
                                                        categoryList[
                                                            categoryListIndex];
                                                    return CategoryAvatarWidget(
                                                      key: Key(
                                                          'Key6th_${categoryListIndex}_of_${categoryList.length}'),
                                                      category:
                                                          categoryListItem,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingLarge,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingLarge,
                                    0.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: FutureBuilder<List<ProductsRow>>(
                                future: ProductsTable().queryRows(
                                  queryFn: (q) => q,
                                  limit: 5,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ProductsRow>
                                      topSellingSectionProductsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    FFAppConstants.paddingMedium
                                                        .toDouble(),
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Top Selling',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Text(
                                                'See All',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 280.0,
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final supaProductsList =
                                                  topSellingSectionProductsRowList
                                                      .toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  16.0,
                                                  0,
                                                ),
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    supaProductsList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(
                                                        width: FFAppConstants
                                                            .paddingMedium
                                                            .toDouble()),
                                                itemBuilder: (context,
                                                    supaProductsListIndex) {
                                                  final supaProductsListItem =
                                                      supaProductsList[
                                                          supaProductsListIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            ProductListCardWidget(
                                                          key: Key(
                                                              'Key472_${supaProductsListIndex}_of_${supaProductsList.length}'),
                                                          productItem: functions
                                                              .convertProductRowToStruct(
                                                                  supaProductsListItem),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingLarge,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    FFAppConstants.paddingMedium.toDouble(),
                                    0.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: FutureBuilder<List<ProductsRow>>(
                                future: ProductsTable().queryRows(
                                  queryFn: (q) => q.order('created_at'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ProductsRow>
                                      newInSectionProductsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    FFAppConstants.paddingMedium
                                                        .toDouble(),
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'New In',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Text(
                                                'See All',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 289.0,
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final supaProductListNew =
                                                  newInSectionProductsRowList
                                                      .toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  FFAppConstants.paddingMedium
                                                      .toDouble(),
                                                  0,
                                                ),
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    supaProductListNew.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(
                                                        width: FFAppConstants
                                                            .paddingMedium
                                                            .toDouble()),
                                                itemBuilder: (context,
                                                    supaProductListNewIndex) {
                                                  final supaProductListNewItem =
                                                      supaProductListNew[
                                                          supaProductListNewIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            ProductListCardWidget(
                                                          key: Key(
                                                              'Keyf1c_${supaProductListNewIndex}_of_${supaProductListNew.length}'),
                                                          productItem: functions
                                                              .convertProductRowToStruct(
                                                                  supaProductListNewItem),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
