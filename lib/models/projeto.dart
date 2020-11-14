import 'package:cloud_firestore/cloud_firestore.dart';

class Projeto {
  String id;
  String idStartup;
  String nomeProjeto;
  String descricao;
  String capaUrl;
  int likes;

  Projeto({
    this.id,
    this.idStartup,
    this.nomeProjeto,
    this.descricao,
    this.capaUrl,
    this.likes,
  });

  factory Projeto.fromDocument(DocumentSnapshot snapshot) {
    return Projeto(
      id: snapshot.id,
      idStartup: snapshot.data()["id_startup"],
      nomeProjeto: snapshot.data()["nome_projeto"],
      descricao: snapshot.data()["descricao"],
      capaUrl: snapshot.data()["capa_url"],
      likes: int.tryParse(snapshot.data()["likes"]) ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_startup": idStartup,
        "nome_projeto": nomeProjeto,
        "descricao": descricao,
        "capa_url": capaUrl,
        "likes": likes,
      };
}
