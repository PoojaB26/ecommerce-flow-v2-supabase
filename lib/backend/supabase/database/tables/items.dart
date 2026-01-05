import '../database.dart';

class ItemsTable extends SupabaseTable<ItemsRow> {
  @override
  String get tableName => 'items';

  @override
  ItemsRow createRow(Map<String, dynamic> data) => ItemsRow(data);
}

class ItemsRow extends SupabaseDataRow {
  ItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get cartId => getField<int>('cart_id');
  set cartId(int? value) => setField<int>('cart_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get quantity => getField<double>('quantity')!;
  set quantity(double value) => setField<double>('quantity', value);

  double get subtotal => getField<double>('subtotal')!;
  set subtotal(double value) => setField<double>('subtotal', value);

  String? get brand => getField<String>('brand');
  set brand(String? value) => setField<String>('brand', value);

  dynamic get productImg => getField<dynamic>('product_img')!;
  set productImg(dynamic value) => setField<dynamic>('product_img', value);

  dynamic get color => getField<dynamic>('color');
  set color(dynamic value) => setField<dynamic>('color', value);

  String? get size => getField<String>('size');
  set size(String? value) => setField<String>('size', value);

  dynamic get price => getField<dynamic>('price')!;
  set price(dynamic value) => setField<dynamic>('price', value);

  String? get orderId => getField<String>('order_id');
  set orderId(String? value) => setField<String>('order_id', value);
}
