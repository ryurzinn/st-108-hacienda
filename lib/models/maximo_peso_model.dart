// To parse this JSON data, do
//
//     final pesoMaximoModel = pesoMaximoModelFromMap(jsonString);

import 'dart:convert';

class PesoMaximoModel {
    PesoMaximoModel({
        required this.id,
        required this.maximo,
    });

    final String id;
    final String maximo;

    factory PesoMaximoModel.fromJson(String str) => PesoMaximoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PesoMaximoModel.fromMap(Map<String, dynamic> json) => PesoMaximoModel(
        id: json["id"],
        maximo: json["maximo"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "maximo": maximo,
    };
}
