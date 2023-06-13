import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());


class DataModel {
  DataModel({
    required this.id,
    required this.funcionarioId,
    required this.linhaId,
    required this.tipo,
    required this.prioridade,
    required this.estado,
    required this.criacao,
  });

  String id;
  String funcionarioId;
  String linhaId;
  String tipo;
  String prioridade;
  String estado;
  String criacao;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"],
    funcionarioId: json["funcionarioId"],
    linhaId: json["linhaId"],
    tipo: json["tipo"],
    prioridade: json["prioridade"],
    estado: json["estado"],
    criacao: json["criacao"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "funcionarioId": funcionarioId,
    "linhaId": linhaId,
    "tipo": tipo,
    "prioridade": prioridade,
    "estado": estado,
    "criacao": criacao,
  };

}