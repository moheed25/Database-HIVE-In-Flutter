import 'dart:convert';

FreeUserListModel FreeUserListModelFromJson(String str) =>
    FreeUserListModel.fromJson(json.decode(str));

String FreeUserListModelToJson(FreeUserListModel data) =>
    json.encode(data.toJson());

class FreeUserListModel {
  bool? success;
  String? message;
  Data? data;

  FreeUserListModel({this.success, this.message, this.data});

  FreeUserListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<Data1>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(new Data1.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data1 {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? gender;
  String? dob;
  String? phone;
  String? otp;
  String? status;
  String? invisibility;
  String? skillId;
  String? cityId;
  Null? longitude;
  Null? latitude;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? active;

  Data1(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.gender,
      this.dob,
      this.phone,
      this.otp,
      this.status,
      this.invisibility,
      this.skillId,
      this.cityId,
      this.longitude,
      this.latitude,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.active});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    otp = json['otp'];
    status = json['status'];
    invisibility = json['invisibility'];
    skillId = json['skill_id'];
    cityId = json['city_id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['status'] = this.status;
    data['invisibility'] = this.invisibility;
    data['skill_id'] = this.skillId;
    data['city_id'] = this.cityId;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
