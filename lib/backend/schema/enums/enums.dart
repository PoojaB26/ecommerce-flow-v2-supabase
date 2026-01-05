import 'package:collection/collection.dart';

enum OptionType {
  size,
  color,
  quantity,
}

enum OrderStatus {
  pending,
  confirmed,
  processed,
  shipped,
  completed,
  cancelled,
  refunded,
}

enum DeliveryStatus {
  pending,
  in_transit,
  out_for_delivery,
  delivered,
  returned,
}

enum CartPriceType {
  subTotal,
  discount,
  totalCost,
}

enum DiscountType {
  percentage,
  fixed,
  free_shipping,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (OptionType):
      return OptionType.values.deserialize(value) as T?;
    case (OrderStatus):
      return OrderStatus.values.deserialize(value) as T?;
    case (DeliveryStatus):
      return DeliveryStatus.values.deserialize(value) as T?;
    case (CartPriceType):
      return CartPriceType.values.deserialize(value) as T?;
    case (DiscountType):
      return DiscountType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
