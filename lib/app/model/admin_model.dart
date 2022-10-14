// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  AdminModel({
    this.idBranch,
    this.email,
    this.name,
  });

  String? idBranch;
  String? email;
  String? name;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        idBranch: json["idBranch"] == null ? null : json["idBranch"],
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "idBranch": idBranch == null ? null : idBranch,
        "email": email == null ? null : email,
        "name": name == null ? null : name,
      };
}
