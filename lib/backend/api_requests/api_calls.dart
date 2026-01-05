import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Product Group Code

class ProductGroup {
  static String getBaseUrl() =>
      'https://xhlo-lkyx-rhhz.n7c.xano.io/api:QAJQKamF';
  static Map<String, String> headers = {};
  static GetCategoryProductListCall getCategoryProductListCall =
      GetCategoryProductListCall();
  static GetAllOrdersCall getAllOrdersCall = GetAllOrdersCall();
}

class GetCategoryProductListCall {
  Future<ApiCallResponse> call({
    String? categoryName = '',
  }) async {
    final baseUrl = ProductGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Category Product List',
      apiUrl: '${baseUrl}/categoryProducts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category_name': categoryName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllOrdersCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = ProductGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Orders',
      apiUrl: '${baseUrl}/orders',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Product Group Code

class GetCategoryListCall {
  static Future<ApiCallResponse> call({
    String? baseUrl,
  }) async {
    baseUrl ??= FFDevEnvironmentValues().baseUrl;

    return ApiManager.instance.makeApiCall(
      callName: 'Get Category List',
      apiUrl: '${baseUrl}/category',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateOrderItemsCall {
  static Future<ApiCallResponse> call({
    dynamic serializedBodyJson,
    String? apikey = '',
  }) async {
    final serializedBody = _serializeJson(serializedBodyJson);
    final ffApiRequestBody = '''
 ${serializedBody}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Order Items',
      apiUrl: 'https://lgmibhlittxsgvscfhtb.supabase.co/rest/v1/items',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
