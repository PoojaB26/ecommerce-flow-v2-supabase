import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  dynamic get price => getField<dynamic>('price')!;
  set price(dynamic value) => setField<dynamic>('price', value);

  List<String> get sizes => getListField<String>('sizes');
  set sizes(List<String>? value) => setListField<String>('sizes', value);

  List<dynamic> get colors => getListField<dynamic>('colors');
  set colors(List<dynamic> value) => setListField<dynamic>('colors', value);

  List<dynamic> get images => getListField<dynamic>('images');
  set images(List<dynamic> value) => setListField<dynamic>('images', value);

  String? get brand => getField<String>('brand');
  set brand(String? value) => setField<String>('brand', value);

  String? get material => getField<String>('material');
  set material(String? value) => setField<String>('material', value);

  String? get careInstructions => getField<String>('care_instructions');
  set careInstructions(String? value) =>
      setField<String>('care_instructions', value);

  String? get returnPolicy => getField<String>('return_policy');
  set returnPolicy(String? value) => setField<String>('return_policy', value);

  int? get soldQuantity => getField<int>('sold_quantity');
  set soldQuantity(int? value) => setField<int>('sold_quantity', value);
}
