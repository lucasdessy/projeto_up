import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_up/models/membro.dart';

class Startup {
  String id;
  String nome;

  // Usuario e Senha sao gerenciados pelo firebase
  String capaUrl;
  String segmento;
  String descricao;
  String pitchUrl;

  //Contatos
  String whatsapp;
  String instagram;
  String facebook;
  List<String> outrosContatos;

  // Fim contatos

  List<Membro> membros;
  List<String> album;

  Startup({
    this.id,
    this.nome,
    this.capaUrl,
    this.segmento,
    this.descricao,
    this.pitchUrl,
    this.whatsapp,
    this.instagram,
    this.facebook,
    this.outrosContatos,
    this.membros,
    this.album,
  });

  factory Startup.fromDocument(DocumentSnapshot snapshot) {
    try {
      return Startup(
        id: snapshot.id,
        nome: snapshot.data()["nome"],
        capaUrl: snapshot.data()["capa_url"] ?? "",
        segmento: snapshot.data()["segmento"],
        descricao: snapshot.data()["descricao"],
        pitchUrl: snapshot.data()["pitch_url"] ?? "",
        whatsapp: snapshot.data()["whatsapp"],
        instagram: snapshot.data()["instagram"],
        facebook: snapshot.data()["facebook"],
        outrosContatos: (snapshot.data()["outros_contatos"] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
        membros: (snapshot.data()["membros"] as List<dynamic>)
            .map(
              (membroSnap) => Membro.fromDocument(membroSnap),
            )
            .toList(),
        album: (snapshot.data()["album"] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
      );
    } catch (e) {
      return Startup();
    }
  }

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "capa_url": capaUrl,
        "segmento": segmento,
        "descricao": descricao,
        "pitch_url": pitchUrl,
        "whatsapp": whatsapp,
        "instagram": instagram,
        "facebook": facebook,
        "outros_contatos": outrosContatos,
        "membros": membros.map(
          (membro) => membro.toJson(),
        ),
        "album": album,
      };
}
