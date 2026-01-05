import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get orderDate => getField<DateTime>('order_date')!;
  set orderDate(DateTime value) => setField<DateTime>('order_date', value);

  int? get shippingAddressId => getField<int>('shipping_address_id');
  set shippingAddressId(int? value) =>
      setField<int>('shipping_address_id', value);

  int? get billingAddressId => getField<int>('billing_address_id');
  set billingAddressId(int? value) =>
      setField<int>('billing_address_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  double get totalAmount => getField<double>('total_amount')!;
  set totalAmount(double value) => setField<double>('total_amount', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
