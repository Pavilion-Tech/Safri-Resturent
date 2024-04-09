class RestaurantModel {
  String? message;
  bool? status;
  Data? data;

  RestaurantModel({this.message, this.status, this.data});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? email;
  String? country;
  List<CategoryId>? categoryId;
  String? currentLatitude;
  String? currentLongitude;
  String? firebaseToken;
  String? whatsappNumber;
  String? phoneNumber;
  String? personalPhoto;
  String? currentLanguage;
  String? address;
  int? status;
  int? totalRate;
  int? openingTime;
  int? closingTime;
  List<String>? workingDays;
  String? opeingStatus;
  int? receivingOrdersStatus;
  int? crowdedStatus;
  List<Null>? rates;

  Data(
      {this.id,
        this.name,
        this.email,
        this.country,
        this.categoryId,
        this.currentLatitude,
        this.currentLongitude,
        this.firebaseToken,
        this.whatsappNumber,
        this.phoneNumber,
        this.personalPhoto,
        this.currentLanguage,
        this.address,
        this.status,
        this.totalRate,
        this.openingTime,
        this.closingTime,
        this.workingDays,
        this.opeingStatus,
        this.receivingOrdersStatus,
        this.crowdedStatus,
        this.rates});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    country = json['country'];
    if (json['category_id'] != null) {
      categoryId = <CategoryId>[];
      json['category_id'].forEach((v) {
        categoryId!.add(new CategoryId.fromJson(v));
      });
    }
    currentLatitude = json['current_latitude'];
    currentLongitude = json['current_longitude'];
    firebaseToken = json['firebase_token'];
    whatsappNumber = json['whatsapp_number'];
    phoneNumber = json['phone_number'];
    personalPhoto = json['personal_photo'];
    currentLanguage = json['current_language'];
    address = json['address'];
    status = json['status'];
    totalRate = json['total_rate'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    workingDays = json['working_days'].cast<String>();
    opeingStatus = json['opeing_status'];
    receivingOrdersStatus = json['receiving_orders_status'];
    crowdedStatus = json['crowded_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country'] = this.country;
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId!.map((v) => v.toJson()).toList();
    }
    data['current_latitude'] = this.currentLatitude;
    data['current_longitude'] = this.currentLongitude;
    data['firebase_token'] = this.firebaseToken;
    data['whatsapp_number'] = this.whatsappNumber;
    data['phone_number'] = this.phoneNumber;
    data['personal_photo'] = this.personalPhoto;
    data['current_language'] = this.currentLanguage;
    data['address'] = this.address;
    data['status'] = this.status;
    data['total_rate'] = this.totalRate;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['working_days'] = this.workingDays;
    data['opeing_status'] = this.opeingStatus;
    data['receiving_orders_status'] = this.receivingOrdersStatus;
    data['crowded_status'] = this.crowdedStatus;

    return data;
  }
}

class CategoryId {
  String? id;
  String? image;
  String? title;

  CategoryId({this.id, this.image, this.title});

  CategoryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    return data;
  }
}
