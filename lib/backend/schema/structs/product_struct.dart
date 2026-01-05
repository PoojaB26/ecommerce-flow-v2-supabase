// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    String? name,
    String? description,
    String? category,
    String? subCategory,
    PriceStruct? price,
    List<String>? sizes,
    List<ColorsStruct>? colors,
    List<ImagesStruct>? images,
    StockStatusStruct? stockStatus,
    List<ReviewsStruct>? reviews,
    double? ratingAverage,
    int? totalReviews,
    List<String>? tags,
    String? availability,
    String? launchDate,
    String? brand,
    String? material,
    String? careInstructions,
    String? returnPolicy,
    List<ShippingOptionStruct>? shippingOptions,
    int? productId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _category = category,
        _subCategory = subCategory,
        _price = price,
        _sizes = sizes,
        _colors = colors,
        _images = images,
        _stockStatus = stockStatus,
        _reviews = reviews,
        _ratingAverage = ratingAverage,
        _totalReviews = totalReviews,
        _tags = tags,
        _availability = availability,
        _launchDate = launchDate,
        _brand = brand,
        _material = material,
        _careInstructions = careInstructions,
        _returnPolicy = returnPolicy,
        _shippingOptions = shippingOptions,
        _productId = productId,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "subCategory" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  set subCategory(String? val) => _subCategory = val;

  bool hasSubCategory() => _subCategory != null;

  // "price" field.
  PriceStruct? _price;
  PriceStruct get price => _price ?? PriceStruct();
  set price(PriceStruct? val) => _price = val;

  void updatePrice(Function(PriceStruct) updateFn) {
    updateFn(_price ??= PriceStruct());
  }

  bool hasPrice() => _price != null;

  // "sizes" field.
  List<String>? _sizes;
  List<String> get sizes => _sizes ?? const [];
  set sizes(List<String>? val) => _sizes = val;

  void updateSizes(Function(List<String>) updateFn) {
    updateFn(_sizes ??= []);
  }

  bool hasSizes() => _sizes != null;

  // "colors" field.
  List<ColorsStruct>? _colors;
  List<ColorsStruct> get colors => _colors ?? const [];
  set colors(List<ColorsStruct>? val) => _colors = val;

  void updateColors(Function(List<ColorsStruct>) updateFn) {
    updateFn(_colors ??= []);
  }

  bool hasColors() => _colors != null;

  // "images" field.
  List<ImagesStruct>? _images;
  List<ImagesStruct> get images => _images ?? const [];
  set images(List<ImagesStruct>? val) => _images = val;

  void updateImages(Function(List<ImagesStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "stockStatus" field.
  StockStatusStruct? _stockStatus;
  StockStatusStruct get stockStatus => _stockStatus ?? StockStatusStruct();
  set stockStatus(StockStatusStruct? val) => _stockStatus = val;

  void updateStockStatus(Function(StockStatusStruct) updateFn) {
    updateFn(_stockStatus ??= StockStatusStruct());
  }

  bool hasStockStatus() => _stockStatus != null;

  // "reviews" field.
  List<ReviewsStruct>? _reviews;
  List<ReviewsStruct> get reviews => _reviews ?? const [];
  set reviews(List<ReviewsStruct>? val) => _reviews = val;

  void updateReviews(Function(List<ReviewsStruct>) updateFn) {
    updateFn(_reviews ??= []);
  }

  bool hasReviews() => _reviews != null;

  // "ratingAverage" field.
  double? _ratingAverage;
  double get ratingAverage => _ratingAverage ?? 0.0;
  set ratingAverage(double? val) => _ratingAverage = val;

  void incrementRatingAverage(double amount) =>
      ratingAverage = ratingAverage + amount;

  bool hasRatingAverage() => _ratingAverage != null;

  // "totalReviews" field.
  int? _totalReviews;
  int get totalReviews => _totalReviews ?? 0;
  set totalReviews(int? val) => _totalReviews = val;

  void incrementTotalReviews(int amount) =>
      totalReviews = totalReviews + amount;

  bool hasTotalReviews() => _totalReviews != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  set tags(List<String>? val) => _tags = val;

  void updateTags(Function(List<String>) updateFn) {
    updateFn(_tags ??= []);
  }

  bool hasTags() => _tags != null;

  // "availability" field.
  String? _availability;
  String get availability => _availability ?? '';
  set availability(String? val) => _availability = val;

  bool hasAvailability() => _availability != null;

  // "launchDate" field.
  String? _launchDate;
  String get launchDate => _launchDate ?? '';
  set launchDate(String? val) => _launchDate = val;

  bool hasLaunchDate() => _launchDate != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;

  bool hasBrand() => _brand != null;

  // "material" field.
  String? _material;
  String get material => _material ?? '';
  set material(String? val) => _material = val;

  bool hasMaterial() => _material != null;

  // "careInstructions" field.
  String? _careInstructions;
  String get careInstructions => _careInstructions ?? '';
  set careInstructions(String? val) => _careInstructions = val;

  bool hasCareInstructions() => _careInstructions != null;

  // "returnPolicy" field.
  String? _returnPolicy;
  String get returnPolicy => _returnPolicy ?? '';
  set returnPolicy(String? val) => _returnPolicy = val;

  bool hasReturnPolicy() => _returnPolicy != null;

  // "shippingOptions" field.
  List<ShippingOptionStruct>? _shippingOptions;
  List<ShippingOptionStruct> get shippingOptions =>
      _shippingOptions ?? const [];
  set shippingOptions(List<ShippingOptionStruct>? val) =>
      _shippingOptions = val;

  void updateShippingOptions(Function(List<ShippingOptionStruct>) updateFn) {
    updateFn(_shippingOptions ??= []);
  }

  bool hasShippingOptions() => _shippingOptions != null;

  // "productId" field.
  int? _productId;
  int get productId => _productId ?? 0;
  set productId(int? val) => _productId = val;

  void incrementProductId(int amount) => productId = productId + amount;

  bool hasProductId() => _productId != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        category: data['category'] as String?,
        subCategory: data['subCategory'] as String?,
        price: data['price'] is PriceStruct
            ? data['price']
            : PriceStruct.maybeFromMap(data['price']),
        sizes: getDataList(data['sizes']),
        colors: getStructList(
          data['colors'],
          ColorsStruct.fromMap,
        ),
        images: getStructList(
          data['images'],
          ImagesStruct.fromMap,
        ),
        stockStatus: data['stockStatus'] is StockStatusStruct
            ? data['stockStatus']
            : StockStatusStruct.maybeFromMap(data['stockStatus']),
        reviews: getStructList(
          data['reviews'],
          ReviewsStruct.fromMap,
        ),
        ratingAverage: castToType<double>(data['ratingAverage']),
        totalReviews: castToType<int>(data['totalReviews']),
        tags: getDataList(data['tags']),
        availability: data['availability'] as String?,
        launchDate: data['launchDate'] as String?,
        brand: data['brand'] as String?,
        material: data['material'] as String?,
        careInstructions: data['careInstructions'] as String?,
        returnPolicy: data['returnPolicy'] as String?,
        shippingOptions: getStructList(
          data['shippingOptions'],
          ShippingOptionStruct.fromMap,
        ),
        productId: castToType<int>(data['productId']),
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'category': _category,
        'subCategory': _subCategory,
        'price': _price?.toMap(),
        'sizes': _sizes,
        'colors': _colors?.map((e) => e.toMap()).toList(),
        'images': _images?.map((e) => e.toMap()).toList(),
        'stockStatus': _stockStatus?.toMap(),
        'reviews': _reviews?.map((e) => e.toMap()).toList(),
        'ratingAverage': _ratingAverage,
        'totalReviews': _totalReviews,
        'tags': _tags,
        'availability': _availability,
        'launchDate': _launchDate,
        'brand': _brand,
        'material': _material,
        'careInstructions': _careInstructions,
        'returnPolicy': _returnPolicy,
        'shippingOptions': _shippingOptions?.map((e) => e.toMap()).toList(),
        'productId': _productId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'subCategory': serializeParam(
          _subCategory,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.DataStruct,
        ),
        'sizes': serializeParam(
          _sizes,
          ParamType.String,
          isList: true,
        ),
        'colors': serializeParam(
          _colors,
          ParamType.DataStruct,
          isList: true,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'stockStatus': serializeParam(
          _stockStatus,
          ParamType.DataStruct,
        ),
        'reviews': serializeParam(
          _reviews,
          ParamType.DataStruct,
          isList: true,
        ),
        'ratingAverage': serializeParam(
          _ratingAverage,
          ParamType.double,
        ),
        'totalReviews': serializeParam(
          _totalReviews,
          ParamType.int,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.String,
          isList: true,
        ),
        'availability': serializeParam(
          _availability,
          ParamType.String,
        ),
        'launchDate': serializeParam(
          _launchDate,
          ParamType.String,
        ),
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'material': serializeParam(
          _material,
          ParamType.String,
        ),
        'careInstructions': serializeParam(
          _careInstructions,
          ParamType.String,
        ),
        'returnPolicy': serializeParam(
          _returnPolicy,
          ParamType.String,
        ),
        'shippingOptions': serializeParam(
          _shippingOptions,
          ParamType.DataStruct,
          isList: true,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        subCategory: deserializeParam(
          data['subCategory'],
          ParamType.String,
          false,
        ),
        price: deserializeStructParam(
          data['price'],
          ParamType.DataStruct,
          false,
          structBuilder: PriceStruct.fromSerializableMap,
        ),
        sizes: deserializeParam<String>(
          data['sizes'],
          ParamType.String,
          true,
        ),
        colors: deserializeStructParam<ColorsStruct>(
          data['colors'],
          ParamType.DataStruct,
          true,
          structBuilder: ColorsStruct.fromSerializableMap,
        ),
        images: deserializeStructParam<ImagesStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImagesStruct.fromSerializableMap,
        ),
        stockStatus: deserializeStructParam(
          data['stockStatus'],
          ParamType.DataStruct,
          false,
          structBuilder: StockStatusStruct.fromSerializableMap,
        ),
        reviews: deserializeStructParam<ReviewsStruct>(
          data['reviews'],
          ParamType.DataStruct,
          true,
          structBuilder: ReviewsStruct.fromSerializableMap,
        ),
        ratingAverage: deserializeParam(
          data['ratingAverage'],
          ParamType.double,
          false,
        ),
        totalReviews: deserializeParam(
          data['totalReviews'],
          ParamType.int,
          false,
        ),
        tags: deserializeParam<String>(
          data['tags'],
          ParamType.String,
          true,
        ),
        availability: deserializeParam(
          data['availability'],
          ParamType.String,
          false,
        ),
        launchDate: deserializeParam(
          data['launchDate'],
          ParamType.String,
          false,
        ),
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        material: deserializeParam(
          data['material'],
          ParamType.String,
          false,
        ),
        careInstructions: deserializeParam(
          data['careInstructions'],
          ParamType.String,
          false,
        ),
        returnPolicy: deserializeParam(
          data['returnPolicy'],
          ParamType.String,
          false,
        ),
        shippingOptions: deserializeStructParam<ShippingOptionStruct>(
          data['shippingOptions'],
          ParamType.DataStruct,
          true,
          structBuilder: ShippingOptionStruct.fromSerializableMap,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductStruct &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        subCategory == other.subCategory &&
        price == other.price &&
        listEquality.equals(sizes, other.sizes) &&
        listEquality.equals(colors, other.colors) &&
        listEquality.equals(images, other.images) &&
        stockStatus == other.stockStatus &&
        listEquality.equals(reviews, other.reviews) &&
        ratingAverage == other.ratingAverage &&
        totalReviews == other.totalReviews &&
        listEquality.equals(tags, other.tags) &&
        availability == other.availability &&
        launchDate == other.launchDate &&
        brand == other.brand &&
        material == other.material &&
        careInstructions == other.careInstructions &&
        returnPolicy == other.returnPolicy &&
        listEquality.equals(shippingOptions, other.shippingOptions) &&
        productId == other.productId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        category,
        subCategory,
        price,
        sizes,
        colors,
        images,
        stockStatus,
        reviews,
        ratingAverage,
        totalReviews,
        tags,
        availability,
        launchDate,
        brand,
        material,
        careInstructions,
        returnPolicy,
        shippingOptions,
        productId
      ]);
}

ProductStruct createProductStruct({
  String? name,
  String? description,
  String? category,
  String? subCategory,
  PriceStruct? price,
  StockStatusStruct? stockStatus,
  double? ratingAverage,
  int? totalReviews,
  String? availability,
  String? launchDate,
  String? brand,
  String? material,
  String? careInstructions,
  String? returnPolicy,
  int? productId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      name: name,
      description: description,
      category: category,
      subCategory: subCategory,
      price: price ?? (clearUnsetFields ? PriceStruct() : null),
      stockStatus:
          stockStatus ?? (clearUnsetFields ? StockStatusStruct() : null),
      ratingAverage: ratingAverage,
      totalReviews: totalReviews,
      availability: availability,
      launchDate: launchDate,
      brand: brand,
      material: material,
      careInstructions: careInstructions,
      returnPolicy: returnPolicy,
      productId: productId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Handle nested data for "price" field.
  addPriceStructData(
    firestoreData,
    product.hasPrice() ? product.price : null,
    'price',
    forFieldValue,
  );

  // Handle nested data for "stockStatus" field.
  addStockStatusStructData(
    firestoreData,
    product.hasStockStatus() ? product.stockStatus : null,
    'stockStatus',
    forFieldValue,
  );

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
