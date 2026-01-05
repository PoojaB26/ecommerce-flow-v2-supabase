import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cartItems = prefs
              .getStringList('ff_cartItems')
              ?.map((x) {
                try {
                  return ItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cartItems;
    });
    _safeInit(() {
      _cartId = prefs.getInt('ff_cartId') ?? _cartId;
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _enableDarkMode = false;
  bool get enableDarkMode => _enableDarkMode;
  set enableDarkMode(bool value) {
    _enableDarkMode = value;
  }

  List<LatLng> _LatLngList = [
    LatLng(37.4071594, -122.0775312),
    LatLng(40.7358633, -73.9910835)
  ];
  List<LatLng> get LatLngList => _LatLngList;
  set LatLngList(List<LatLng> value) {
    _LatLngList = value;
  }

  void addToLatLngList(LatLng value) {
    LatLngList.add(value);
  }

  void removeFromLatLngList(LatLng value) {
    LatLngList.remove(value);
  }

  void removeAtIndexFromLatLngList(int index) {
    LatLngList.removeAt(index);
  }

  void updateLatLngListAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    LatLngList[index] = updateFn(_LatLngList[index]);
  }

  void insertAtIndexInLatLngList(int index, LatLng value) {
    LatLngList.insert(index, value);
  }

  List<LatLng> _NYCLatLngList = [
    LatLng(40.7682178, -73.9828988),
    LatLng(40.7261816, -74.0021307),
    LatLng(40.7419313, -73.984644)
  ];
  List<LatLng> get NYCLatLngList => _NYCLatLngList;
  set NYCLatLngList(List<LatLng> value) {
    _NYCLatLngList = value;
  }

  void addToNYCLatLngList(LatLng value) {
    NYCLatLngList.add(value);
  }

  void removeFromNYCLatLngList(LatLng value) {
    NYCLatLngList.remove(value);
  }

  void removeAtIndexFromNYCLatLngList(int index) {
    NYCLatLngList.removeAt(index);
  }

  void updateNYCLatLngListAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    NYCLatLngList[index] = updateFn(_NYCLatLngList[index]);
  }

  void insertAtIndexInNYCLatLngList(int index, LatLng value) {
    NYCLatLngList.insert(index, value);
  }

  List<ItemsStruct> _cartItems = [];
  List<ItemsStruct> get cartItems => _cartItems;
  set cartItems(List<ItemsStruct> value) {
    _cartItems = value;
    prefs.setStringList(
        'ff_cartItems', value.map((x) => x.serialize()).toList());
  }

  void addToCartItems(ItemsStruct value) {
    cartItems.add(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void removeFromCartItems(ItemsStruct value) {
    cartItems.remove(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCartItems(int index) {
    cartItems.removeAt(index);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void updateCartItemsAtIndex(
    int index,
    ItemsStruct Function(ItemsStruct) updateFn,
  ) {
    cartItems[index] = updateFn(_cartItems[index]);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCartItems(int index, ItemsStruct value) {
    cartItems.insert(index, value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  List<String> _localWishlist = [];
  List<String> get localWishlist => _localWishlist;
  set localWishlist(List<String> value) {
    _localWishlist = value;
  }

  void addToLocalWishlist(String value) {
    localWishlist.add(value);
  }

  void removeFromLocalWishlist(String value) {
    localWishlist.remove(value);
  }

  void removeAtIndexFromLocalWishlist(int index) {
    localWishlist.removeAt(index);
  }

  void updateLocalWishlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    localWishlist[index] = updateFn(_localWishlist[index]);
  }

  void insertAtIndexInLocalWishlist(int index, String value) {
    localWishlist.insert(index, value);
  }

  int _cartId = 0;
  int get cartId => _cartId;
  set cartId(int value) {
    _cartId = value;
    prefs.setInt('ff_cartId', value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
  }

  String _apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxnbWliaGxpdHR4c2d2c2NmaHRiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1NDA4MDIsImV4cCI6MjA0ODExNjgwMn0.ZDHt-m7BbIVVXZntksAR5De0wVqYG7Pzx6Syjg7fATw';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    prefs.setString('ff_apiKey', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
