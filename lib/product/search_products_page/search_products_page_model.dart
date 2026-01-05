import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/home_page_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_products_page_widget.dart' show SearchProductsPageWidget;
import 'package:flutter/material.dart';

class SearchProductsPageModel
    extends FlutterFlowModel<SearchProductsPageWidget> {
  ///  Local state fields for this page.

  List<ProductStruct> searchResults = [];
  void addToSearchResults(ProductStruct item) => searchResults.add(item);
  void removeFromSearchResults(ProductStruct item) =>
      searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(int index, ProductStruct item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(
          int index, Function(ProductStruct) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  ///  State fields for stateful widgets in this page.

  // Model for HomePageAppBar component.
  late HomePageAppBarModel homePageAppBarModel;
  // State field(s) for searchQuery widget.
  FocusNode? searchQueryFocusNode;
  TextEditingController? searchQueryTextController;
  String? Function(BuildContext, String?)? searchQueryTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in searchQuery widget.
  List<ProductsRow>? queryResults;

  @override
  void initState(BuildContext context) {
    homePageAppBarModel = createModel(context, () => HomePageAppBarModel());
  }

  @override
  void dispose() {
    homePageAppBarModel.dispose();
    searchQueryFocusNode?.dispose();
    searchQueryTextController?.dispose();
  }
}
