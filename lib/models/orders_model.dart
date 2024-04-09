class OrdersModel {
  String? message;
  bool? status;
  Data? data;

  OrdersModel({this.message, this.status, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  int? pages;
  int? count;
  List<OrderData>? data;

  Data({this.currentPage, this.pages, this.count, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    pages = json['pages'];
    count = json['count'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) { data!.add(new OrderData.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['pages'] = this.pages;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderData {
  String? id;
  int? status;
  int? itemNumber;
  int? dinnerType;
  String? providerId;
  String? providerName;
  String? providerPhone;
  String? providerLatitude;
  String? providerLongitude;
  String? providerImage;
  String? parentProviderImage;
  String? userLatitude;
  String? userLongitude;
  String? additionalNotes;
  List<Products>? products;
  int? serviceType;
  String? appFees;
  String? vatValue;
  String? subTotalPrice;
  String? shippingCharges;
  String? totalPrice;
  String? usedWalletPrice;
  String? paymentMethod;
  String? userName;
  String? userPhone;
  List<UserAddress>? userAddress;
  String? orderedDate;
  String? createdAt;
  String? giftType;
  GiftProduct? giftProduct;
  GiftWalletsPriceId? giftWalletsPriceId;

  OrderData({this.id, this.status, this.itemNumber, this.dinnerType, this.providerId, this.providerName, this.providerPhone, this.providerLatitude, this.providerLongitude, this.providerImage, this.parentProviderImage, this.userLatitude, this.userLongitude, this.products, this.serviceType, this.appFees, this.vatValue, this.subTotalPrice, this.shippingCharges, this.totalPrice, this.usedWalletPrice, this.paymentMethod, this.userAddress, this.orderedDate, this.createdAt});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    giftType = json['gift_type'];
    giftProduct = json['gift_product'] != null
        ? new GiftProduct.fromJson(json['gift_product'])
        : null;
    giftWalletsPriceId = json['gift_wallets_price_id'] != null
        ? new GiftWalletsPriceId.fromJson(json['gift_wallets_price_id'])
        : null;
    status = json['status'];
    itemNumber = json['item_number'];
    dinnerType = json['dinner_type'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    additionalNotes = json['additional_notes'];
    providerPhone = json['provider_phone'];
    providerLatitude = json['provider_latitude'];
    providerLongitude = json['provider_longitude'];
    providerImage = json['provider_image'];
    parentProviderImage = json['parent_provider_image'];
    userLatitude = json['user_latitude'];
    userLongitude = json['user_longitude'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) { products!.add(new Products.fromJson(v)); });
    }
    serviceType = json['service_type'];
    appFees = json['app_fees'];
    vatValue = json['vat_value'];
    subTotalPrice = json['sub_total_price'];
    shippingCharges = json['shipping_charges'];
    totalPrice = json['total_price'];
    usedWalletPrice = json['used_wallet_price'];
    paymentMethod = json['payment_method'];
    if (json['user_address'] != null) {
      userAddress = <UserAddress>[];
      json['user_address'].forEach((v) { userAddress!.add(new UserAddress.fromJson(v)); });
    }
    orderedDate = json['ordered_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['item_number'] = this.itemNumber;
    data['dinner_type'] = this.dinnerType;
    data['provider_id'] = this.providerId;
    data['provider_name'] = this.providerName;
    data['provider_phone'] = this.providerPhone;
    data['provider_latitude'] = this.providerLatitude;
    data['provider_longitude'] = this.providerLongitude;
    data['provider_image'] = this.providerImage;
    data['parent_provider_image'] = this.parentProviderImage;
    data['user_latitude'] = this.userLatitude;
    data['user_longitude'] = this.userLongitude;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['service_type'] = this.serviceType;
    data['app_fees'] = this.appFees;
    data['vat_value'] = this.vatValue;
    data['sub_total_price'] = this.subTotalPrice;
    data['shipping_charges'] = this.shippingCharges;
    data['total_price'] = this.totalPrice;
    data['used_wallet_price'] = this.usedWalletPrice;
    data['payment_method'] = this.paymentMethod;
    if (this.userAddress != null) {
      data['user_address'] = this.userAddress!.map((v) => v.toJson()).toList();
    }
    data['ordered_date'] = this.orderedDate;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Products {
  String? id;
  String? title;
  String? image;
  dynamic totalRate;
  String? selectedSize;
  String? selectedSizeName;
  String? selectedSizePriceBeforeDiscount;
  String? selectedSizePriceAfterDiscount;
  String? priceAfterDiscount;
  int? orderedQuantity;
  List<Extra>? extras;
  List<Types>? types;

  Products({this.id, this.title, this.image, this.totalRate, this.selectedSize, this.selectedSizeName, this.selectedSizePriceBeforeDiscount, this.selectedSizePriceAfterDiscount, this.priceAfterDiscount, this.orderedQuantity, this.extras, this.types});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    totalRate = json['total_rate'];
    selectedSize = json['selected_size'];
    selectedSizeName = json['selected_size_name'];
    selectedSizePriceBeforeDiscount = json['selected_size_price_before_discount'];
    selectedSizePriceAfterDiscount = json['selected_size_price_after_discount'];
    priceAfterDiscount = json['price_after_discount'];
    orderedQuantity = json['ordered_quantity'];
    if (json['extras'] != null) {
      extras = <Extra>[];
      json['extras'].forEach((v) { extras!.add(new Extra.fromJson(v)); });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) { types!.add(new Types.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['total_rate'] = this.totalRate;
    data['selected_size'] = this.selectedSize;
    data['selected_size_name'] = this.selectedSizeName;
    data['selected_size_price_before_discount'] = this.selectedSizePriceBeforeDiscount;
    data['selected_size_price_after_discount'] = this.selectedSizePriceAfterDiscount;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['ordered_quantity'] = this.orderedQuantity;
    if (this.extras != null) {
      data['extras'] = this.extras!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Types {
  String? id;
  String? name;
  dynamic price;

  Types({this.id, this.name, this.price});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class Extra {
  String? id;
  String? name;
  dynamic price;


  Extra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }

}


class UserAddress {
  String? id;
  String? title;

  UserAddress({this.id, this.title});

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;

  }
}

class GiftWalletsPriceId {
  String? sId;
  dynamic price;
  dynamic giftStartShowPrice;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? status;

  GiftWalletsPriceId(
      {this.sId,
        this.price,
        this.giftStartShowPrice,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.status});

  GiftWalletsPriceId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    giftStartShowPrice = json['gift_start_show_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['gift_start_show_price'] = this.giftStartShowPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    data['status'] = this.status;
    return data;
  }
}


class GiftProduct {
  String? id;
  String? title;
  String? image;
  dynamic totalRate;

  GiftProduct({this.id, this.title, this.image, this.totalRate});

  GiftProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    totalRate = json['total_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['total_rate'] = this.totalRate;
    return data;
  }
}


