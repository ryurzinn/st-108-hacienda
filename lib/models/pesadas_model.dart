// To parse this JSON data, do
//
//     final pesadasModel = pesadasModelFromMap(jsonString);

import 'dart:convert';

class PesadasModel {
    PesadasModel({
        required this.id,
        required this.fecha,
        required this.hora,
        required this.indicador,
        required this.lote,
        required this.estado,
        required this.caravana,
        required this.peso,
    });

    late final int id;
    final String fecha;
    final String hora;
    final String indicador;
    final String lote;
    final String estado;
    final String caravana;
    final String peso;

    factory PesadasModel.fromJson(String str) => PesadasModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PesadasModel.fromMap(Map<String, dynamic> json) => PesadasModel(
        id: json["id"],
        fecha: json["fecha"],
        hora: json["hora"],
        indicador: json["indicador"],
        lote: json["lote"],
        estado: json["estado"],
        caravana: json["caravana"],
        peso: json["peso"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fecha": fecha,
        "hora": hora,
        "indicador": indicador,
        "lote": lote,
        "estado": estado,
        "caravana": caravana,
        "peso": peso,
    };

    static List<String> listaPesadasModel(){
     return [
      "id",
      "fecha",
      "hora",
      "indicador",
      "lote",
      "estado",
      "caravana",
      "peso"];
    }
}
