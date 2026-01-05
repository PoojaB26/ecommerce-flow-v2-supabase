import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  int? get addressId => getField<int>('address_id');
  set addressId(int? value) => setField<int>('address_id', value);

  int? get cartId => getField<int>('cart_id');
  set cartId(int? value) => setField<int>('cart_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);
}
