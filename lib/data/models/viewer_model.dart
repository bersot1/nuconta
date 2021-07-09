// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import '../../data/models/models.dart';

ViewerModel viewerModelFromJson(String str) =>
    ViewerModel.fromJson(json.decode(str));

String viewerModelToJson(ViewerModel data) => json.encode(data.toJson());

class ViewerModel {
  ViewerModel({
    required this.id,
    required this.name,
    required this.balance,
    required this.offers,
  });

  String id;
  String name;
  int balance;
  List<OfferModel> offers;

  factory ViewerModel.fromJson(Map<String, dynamic> json) => ViewerModel(
        id: json["id"],
        name: json["name"],
        balance: json["balance"],
        offers: List<OfferModel>.from(
            json["offers"].map((x) => OfferModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "balance": balance,
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}
