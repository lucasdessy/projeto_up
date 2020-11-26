import 'package:cloud_firestore/cloud_firestore.dart';

class Projeto {
  String id;
  String idStartup;
  String nomeProjeto;
  String descricao;
  String capaUrl;

  // Estatisticas
  int visualizacoes;
  int anoCriado;

  Projeto({
    this.id,
    this.idStartup,
    this.nomeProjeto,
    this.descricao,
    this.capaUrl,
    this.visualizacoes,
    this.anoCriado,
  });

  factory Projeto.fromDocument(DocumentSnapshot snapshot) {
    return Projeto(
      id: snapshot.id,
      idStartup: snapshot.data()["id_startup"],
      nomeProjeto: snapshot.data()["nome_projeto"],
      descricao: snapshot.data()["descricao"],
      capaUrl: snapshot.data()["capa_url"],
      visualizacoes:
          int.tryParse((snapshot.data()["visualizacoes"] ?? 0).toString()),
      anoCriado: int.tryParse(
          (snapshot.data()["ano_criado"] ?? DateTime.now().year).toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "id_startup": idStartup,
        "nome_projeto": nomeProjeto,
        "descricao": descricao,
        "capa_url": capaUrl,
        "visualizacoes": visualizacoes,
        "ano_criado": anoCriado,
      };
}
