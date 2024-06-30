import 'dart:convert';

JobDataModel emptyFromJson(String str) => JobDataModel.fromJson(json.decode(str));

String emptyToJson(JobDataModel data) => json.encode(data.toJson());

class JobDataModel {
  JobDataModel({
    this.statusCode,
    this.data,
  });

  int? statusCode;
  Data? data;

  factory JobDataModel.fromJson(Map<String, dynamic> json) => JobDataModel(
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.activeJobs,
    this.inprocess,
    this.completed,
    this.cancelled,
  });

  int? activeJobs;
  int? inprocess;
  int? completed;
  int? cancelled;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        activeJobs: json["ActiveJobs"],
        inprocess: json["Inprocess"],
        completed: json["Completed"],
        cancelled: json["Cancelled"],
      );

  Map<String, dynamic> toJson() => {
        "ActiveJobs": activeJobs,
        "Inprocess": inprocess,
        "Completed": completed,
        "Cancelled": cancelled,
      };
}
