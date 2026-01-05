import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? convertStringToDateTime(String stringDate) {
  DateTime date = DateTime.parse(stringDate);

  return date;
}

double calculateCartTotals(
  List<ItemsStruct> items,
  CartPriceType cartPriceType,
) {
  // check if cartPricetype enum == discount, then iterate through items and add all items.discount?
  if (cartPriceType == CartPriceType.discount) {
    double totalDiscount = 0.0;

    items.forEach((element) {
      totalDiscount += element.price.discount;
    });
    return totalDiscount;
  } else if (cartPriceType == CartPriceType.subTotal) {
    double subTotal = 0.0;

    items.forEach((element) {
      subTotal += element.price.amount * element.quantity;
    });
    return subTotal;
  } else if (cartPriceType == CartPriceType.totalCost) {
    double subTotal = calculateCartTotals(items, CartPriceType.subTotal);
    double discount = calculateCartTotals(items, CartPriceType.discount);
    return subTotal - discount;
  } else {
    return 0.0;
  }
}

double calculateTotalWithCoupon(
  CouponsRecord? appliedCoupon,
  List<ItemsStruct> items,
) {
  double subTotal = calculateCartTotals(items, CartPriceType.subTotal);
  double discount = calculateCartTotals(items, CartPriceType.discount);
  // calculateTotalWithCouponCode of percentage
  double total = subTotal;

  total -= discount;

  if (appliedCoupon != null) {
    if (appliedCoupon.discountType == DiscountType.percentage) {
      total *= (1 - appliedCoupon.value / 100);
    } else if (appliedCoupon.discountType == DiscountType.fixed) {
      total -= appliedCoupon.value;
    }
  }
  return double.parse(total.toStringAsFixed(2));
}

bool checkIfProductIdExistsInCart(
  List<ItemsStruct> cartItems,
  String productId,
) {
  return cartItems.any((item) => item.productId == productId);
}

List<ItemsStruct> removeItemFromCartItems(
  List<ItemsStruct> cartitems,
  int deleteIndex,
) {
  // remove Item From CartItems
  cartitems.removeAt(deleteIndex);
  return cartitems;
}

List<ProductStruct> convertProductRowsToStructList(
    List<ProductsRow> productRows) {
  List<ProductStruct> convertedProducts = [];

  for (final productRow in productRows) {
    List<ImagesStruct> convertedImages = [];
    List<ColorsStruct> convertedColors = [];

    if (!(productRow.images.length == 0)) {
      convertedImages = productRow.images.map<ImagesStruct>((dynamic image) {
        final Map<String, dynamic> imageMap = Map<String, dynamic>.from(image);
        return ImagesStruct(
          large: imageMap['large'] as String?,
          thumbnail: imageMap['thumbnail'] as String?,
        );
      }).toList();
    }

    if (!(productRow.colors.length == 0)) {
      convertedColors = productRow.colors.map<ColorsStruct>((dynamic color) {
        final Map<String, dynamic> colorMap = Map<String, dynamic>.from(color);
        return ColorsStruct(
          colorName: colorMap['colorName'] as String?,
          colorHex: colorMap['colorHex'] as String?,
        );
      }).toList();
    }

    convertedProducts.add(ProductStruct(
      productId: productRow.id,
      name: productRow.name as String?,
      price: PriceStruct(
        currency: productRow.price['currency'] as String?,
        amount: productRow.price['amount'] as double?,
      ),
      images: convertedImages,
      colors: convertedColors,
      sizes: productRow.sizes as List<String>?,
      brand: productRow.brand as String?,
      description: productRow.description as String?,
    ));
  }

  return convertedProducts;
}

List<ItemsStruct> convertItemsRowstoStruct(List<ItemsRow> itemsRow) {
// Initialize an empty list for ItemsStruct
  List<ItemsStruct> items = [];

  // Check if itemsRow is null or empty
  if (itemsRow == null || itemsRow.isEmpty) {
    return items; // Return an empty list if no rows exist
  }

  // Iterate over all items in itemsRow and convert to ItemsStruct
  // Iterate over all items in itemsRow and convert to ItemsStruct
  for (final row in itemsRow) {
    // Parse and convert price field (assuming JSON structure)
    final Map<String, dynamic>? priceMap =
        row.price != null ? Map<String, dynamic>.from(row.price) : null;
    final double? priceAmount = priceMap?['amount']?.toDouble();
    final String? priceCurrency = priceMap?['currency'];

    // Parse and convert color field (assuming JSON structure)
    final Map<String, dynamic>? colorMap =
        row.color != null ? Map<String, dynamic>.from(row.color) : null;
    final String? colorName = colorMap?['colorName'];
    final String? colorHex = colorMap?['colorHex'];

    // Add converted row to the list
    items.add(ItemsStruct(
      productId: row.productId,
      quantity: row.quantity?.toInt() ?? 0,
      // Handle potential null quantity
      price: PriceStruct(
        currency: priceCurrency,
        amount: priceAmount,
      ),
      // Map back to expected price structure
      name: row.name,
      productImg: row.productImg,
      color: ColorsStruct(
        colorName: colorName,
        colorHex: colorHex,
      ),
      // Map back to expected color structure
      size: row.size,
      brand: row.brand,
    ));
  }

  return items; // Return the populated list
}

ProductStruct convertProductRowToStruct(ProductsRow productRow) {
  //

  List<ImagesStruct> convertedImages = [];
  List<ColorsStruct> convertedColors = [];

  if (!(productRow.images.length == 0)) {
    convertedImages = productRow.images.map((dynamic image) {
      final Map<String, dynamic> imageMap = Map<String, dynamic>.from(image);
      return ImagesStruct(
        large: imageMap['large'] as String?,
        thumbnail: imageMap['thumbnail'] as String?,
      );
    }).toList();
  }

  if (!(productRow.colors.length == 0)) {
    convertedColors = productRow.colors.map((dynamic color) {
      final Map<String, dynamic> colorMap = Map<String, dynamic>.from(color);
      return ColorsStruct(
        colorName: colorMap['colorName'] as String?,
        colorHex: colorMap['colorHex'] as String?,
      );
    }).toList();
  }

  return ProductStruct(
    productId: productRow.id,
    name: productRow.name,
    price: PriceStruct(
      currency: productRow.price['currency'] as String?,
      amount: productRow.price['amount'] as double?,
    ),
    images: convertedImages,
    colors: convertedColors,
    sizes: productRow.sizes,
    brand: productRow.brand,
    description: productRow.description,
  );
}
