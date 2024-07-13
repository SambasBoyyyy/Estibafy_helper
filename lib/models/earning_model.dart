import 'dart:convert';

class EarningModel {
  EarningModel({
    this.statusCode,
    this.data,
  });

  final int? statusCode;
  final Data? data;

  factory EarningModel.fromJson(String str) => EarningModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EarningModel.fromMap(Map<String, dynamic> json) => EarningModel(
    statusCode: json["status_code"] == null ? null : json["status_code"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status_code": statusCode,
    "data": data?.toMap(),
  };
}

class Data {
  Data({
    this.releasesPaymentEarning,
    this.unreleasedPaymentEarning,
    this.detailJobsStatus,
  });

  final PaymentEarning? releasesPaymentEarning;
  final PaymentEarning? unreleasedPaymentEarning;
  final List<DetailJobStatus>? detailJobsStatus;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    releasesPaymentEarning: json["releases_payment_earning"] == null ? null : PaymentEarning.fromMap(json["releases_payment_earning"]),
    unreleasedPaymentEarning: json["unreleased_payment_earning"] == null ? null : PaymentEarning.fromMap(json["unreleased_payment_earning"]),
    detailJobsStatus: json["detail_jobs_status"] == null ? null : List<DetailJobStatus>.from(json["detail_jobs_status"].map((x) => DetailJobStatus.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "releases_payment_earning": releasesPaymentEarning?.toMap(),
    "unreleased_payment_earning": unreleasedPaymentEarning?.toMap(),
    "detail_jobs_status": detailJobsStatus == null ? null : List<dynamic>.from(detailJobsStatus!.map((x) => x.toMap())),
  };
}

class PaymentEarning {
  PaymentEarning({
    this.totalJobsDone,
    this.totalAmount,
    this.totalNumberOfDaysWorked,
  });

  final int? totalJobsDone;
  final double? totalAmount;
  final int? totalNumberOfDaysWorked;

  factory PaymentEarning.fromJson(String str) => PaymentEarning.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentEarning.fromMap(Map<String, dynamic> json) => PaymentEarning(
    totalJobsDone: json["total_jobs_done"] == null ? null : json["total_jobs_done"],
    totalAmount: json["total_amount"] == null ? null : json["total_amount"].toDouble(),
    totalNumberOfDaysWorked: json["total_number_of_days_worked"] == null ? null : json["total_number_of_days_worked"],
  );

  Map<String, dynamic> toMap() => {
    "total_jobs_done": totalJobsDone,
    "total_amount": totalAmount,
    "total_number_of_days_worked": totalNumberOfDaysWorked,
  };
}

class DetailJobStatus {
  DetailJobStatus({
    this.id,
    this.checkoutId,
    this.jobId,
    this.helperId,
    this.totalAmount,
    this.tax,
    this.subTotal,
    this.tipId,
    this.hours,
    this.releaseStatus,
    this.paymentCredentialId,
    this.createdAt,
    this.updatedAt,
    this.job,
  });

  final int? id;
  final int? checkoutId;
  final int? jobId;
  final int? helperId;
  final double? totalAmount;
  final double? tax;
  final double? subTotal;
  final int? tipId;
  final int? hours;
  final String? releaseStatus;
  final int? paymentCredentialId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Job? job;

  factory DetailJobStatus.fromJson(String str) => DetailJobStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailJobStatus.fromMap(Map<String, dynamic> json) => DetailJobStatus(
    id: json["id"],
    checkoutId: json["checkout_id"],
    jobId: json["job_id"],
    helperId: json["helper_id"],
    totalAmount: json["total_amount"] == null ? null : json["total_amount"].toDouble(),
    tax: json["tax"] == null ? null : json["tax"].toDouble(),
    subTotal: json["sub_total"] == null ? null : json["sub_total"].toDouble(),
    tipId: json["tip_id"],
    hours: json["hours"],
    releaseStatus: json["release_status"],
    paymentCredentialId: json["payment_credential_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    job: json["job"] == null ? null : Job.fromMap(json["job"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "checkout_id": checkoutId,
    "job_id": jobId,
    "helper_id": helperId,
    "total_amount": totalAmount,
    "tax": tax,
    "sub_total": subTotal,
    "tip_id": tipId,
    "hours": hours,
    "release_status": releaseStatus,
    "payment_credential_id": paymentCredentialId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "job": job?.toMap(),
  };
}

class Job {
  Job({
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
    this.jobStatus,
    this.jobComment,
  });

  final int? id;
  final String? name;
  final String? address;
  final int? containerId;
  final String? packageType;
  final String? imageFile;
  final String? voiceFile;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? userId;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? instructions;
  final String? latitude;
  final String? longitude;
  final int? approvedBy;
  final String? jobStatus;
  final String? jobComment;

  factory Job.fromJson(String str) => Job.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Job.fromMap(Map<String, dynamic> json) => Job(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    containerId: json["container_id"],
    packageType: json["package_type"],
    imageFile: json["image_file"],
    voiceFile: json["voice_file"],
    startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
    endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
    userId: json["user_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    instructions: json["instructions"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    approvedBy: json["approved_by"],
    jobStatus: json["job_status"],
    jobComment: json["job_comment"],
  );

  Map<String, dynamic> toMap() => {
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
    "job_status": jobStatus,
    "job_comment": jobComment,
  };
}
