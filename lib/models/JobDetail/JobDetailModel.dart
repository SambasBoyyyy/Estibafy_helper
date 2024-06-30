// To parse this JSON data, do
//
//     final jobDetailsModel = jobDetailsModelFromJson(jsonString);

import 'dart:convert';

JobDetailsModel jobDetailsModelFromJson(String str) =>
    JobDetailsModel.fromJson(json.decode(str));

String jobDetailsModelToJson(JobDetailsModel data) =>
    json.encode(data.toJson());

class JobDetailsModel {
  JobDetailsModel({
    this.statusCode,
    this.msg,
    this.data,
  });

  int? statusCode;
  String? msg;
  Data? data;

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        statusCode: json["statusCode"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.address,
    this.containerId,
    this.packageType,
    this.imageFile,
    this.voiceFile,
    this.startTime,
    this.endTime,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructions,
    this.latitude,
    this.longitude,
    this.approvedBy,
    this.checkout,
    this.jobHelpers,
  });

  int? id;
  String? name;
  String? address;
  int? containerId;
  String? packageType;
  String? imageFile;
  String? voiceFile;
  DateTime? startTime;
  DateTime? endTime;
  int? userId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic instructions;
  double? latitude;
  double? longitude;
  String? approvedBy;
  Checkout? checkout;
  List<JobHelper>? jobHelpers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        containerId: json["container_id"],
        packageType: json["package_type"],
        imageFile: json["image_file"],
        voiceFile: json["voice_file"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        userId: json["user_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        instructions: json["instructions"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        approvedBy: json["approved_by"],
        checkout: Checkout.fromJson(json["checkout"]),
        jobHelpers: List<JobHelper>.from(
            json["job_helpers"].map((x) => JobHelper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "container_id": containerId,
        "package_type": packageType,
        "image_file": imageFile,
        "voice_file": voiceFile,
        "start_time": startTime?.toIso8601String(),
        "end_time": endTime?.toIso8601String(),
        "user_id": userId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "instructions": instructions,
        "latitude": latitude,
        "longitude": longitude,
        "approved_by": approvedBy,
        "checkout": checkout?.toJson(),
        "job_helpers": List<dynamic>.from(jobHelpers!.map((x) => x.toJson())),
      };
}

class Checkout {
  Checkout({
    this.id,
    this.jobId,
    this.total,
    this.tax,
    this.taxRate,
    this.subTotal,
    this.baseFare,
    this.userId,
    this.totalHelpers,
    this.days,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? jobId;
  String? total;
  String? tax;
  String? taxRate;
  String? subTotal;
  String? baseFare;
  int? userId;
  int? totalHelpers;
  int? days;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        id: json["id"],
        jobId: json["job_id"],
        total: json["total"],
        tax: json["tax"],
        taxRate: json["tax_rate"],
        subTotal: json["sub_total"],
        baseFare: json["base_fare"],
        userId: json["user_id"],
        totalHelpers: json["total_helpers"],
        days: json["days"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_id": jobId,
        "total": total,
        "tax": tax,
        "tax_rate": taxRate,
        "sub_total": subTotal,
        "base_fare": baseFare,
        "user_id": userId,
        "total_helpers": totalHelpers,
        "days": days,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class JobHelper {
  JobHelper({
    this.id,
    this.jobId,
    this.userId,
    this.helperId,
    this.status,
    this.jobCommentStatus,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.helperProfile,
  });

  int? id;
  int? jobId;
  int? userId;
  int? helperId;
  String? status;
  String? jobCommentStatus;
  String? approvedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  HelperProfile? helperProfile;

  factory JobHelper.fromJson(Map<String, dynamic> json) => JobHelper(
        id: json["id"],
        jobId: json["job_id"],
        userId: json["user_id"],
        helperId: json["helper_id"],
        status: json["status"],
        jobCommentStatus: json["job_comment_status"],
        approvedBy: json["approved_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        helperProfile: HelperProfile.fromJson(json["helper_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_id": jobId,
        "user_id": userId,
        "helper_id": helperId,
        "status": status,
        "job_comment_status": jobCommentStatus,
        "approved_by": approvedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "helper_profile": helperProfile?.toJson(),
      };
}

class HelperProfile {
  HelperProfile({
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
  dynamic? emailVerifiedAt;
  int? status;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? latitude;
  double? longitude;
  String? approved;
  dynamic? approvedBy;
  int? govermentId;

  factory HelperProfile.fromJson(Map<String, dynamic> json) => HelperProfile(
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
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "approved": approved,
        "approved_by": approvedBy,
        "goverment_id": govermentId,
      };
}
