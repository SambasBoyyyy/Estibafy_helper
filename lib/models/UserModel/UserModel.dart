// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.error,
    this.user,
    this.accessToken,
  });

  bool? error;
  UserData? user;
  String? accessToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        error: json["error"],
        user: UserData.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "user": user?.toJson(),
        "access_token": accessToken,
      };
}

class UserData {
  UserData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.accessToken,
    this.emailVerifiedAt,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.approved,
    this.approvedBy,
    this.govermentId,
  });

  int? id;
  String? name;
  String? email;
  String? mobile;
  String? image;
  String? accessToken;
  dynamic emailVerifiedAt;
  int? status;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? latitude;
  double? longitude;
  String? approved;
  dynamic approvedBy;
  dynamic govermentId;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
        accessToken: json["access_token"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // latitude: json["latitude"].toDouble(),
        // longitude: json["longitude"].toDouble(),
        approved: json["approved"],
        approvedBy: json["approved_by"],
        govermentId: json["goverment_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "image": image,
        "access_token": accessToken,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "latitude": latitude,
        "longitude": longitude,
        "approved": approved,
        "approved_by": approvedBy,
        "goverment_id": govermentId,
      };

  map(UserData Function(dynamic e) param0) {}
}
