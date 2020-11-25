import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_up/models/membro.dart';
import 'package:projeto_up/utils/up_network_assets.dart';

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

  // Estatisticas
  int visualizacoes;
  int anoCriado;

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
    this.visualizacoes,
    this.anoCriado,
  });

  Startup clone() {
    return new Startup(
      id: this.id,
      nome: this.nome,
      capaUrl: this.capaUrl,
      segmento: this.segmento,
      descricao: this.descricao,
      pitchUrl: this.pitchUrl,
      whatsapp: this.whatsapp,
      instagram: this.instagram,
      facebook: this.facebook,
      outrosContatos: this.outrosContatos,
      membros: this.membros,
      album: this.album,
      visualizacoes: this.visualizacoes,
      anoCriado: this.anoCriado,
    );
  }

  factory Startup.fromDocument(DocumentSnapshot snapshot) {
    return Startup(
      id: snapshot.id,
      nome: snapshot.data()["nome"],
      capaUrl: snapshot.data()["capa_url"] ?? UpNetworkAssets.noImage,
      segmento: snapshot.data()["segmento"],
      descricao: snapshot.data()["descricao"],
      pitchUrl: snapshot.data()["pitch_url"] ?? "",
      whatsapp: snapshot.data()["whatsapp"],
      instagram: snapshot.data()["instagram"],
      facebook: snapshot.data()["facebook"],
      outrosContatos: snapshot.data()["outros_contatos"] == null
          ? null
          : (snapshot.data()["outros_contatos"] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
      membros: snapshot.data()["membros"] == null
          ? null
          : (snapshot.data()["membros"] as List<dynamic>)
              .map(
                (membroSnap) => Membro.fromDocument(membroSnap),
              )
              .toList(),
      album: snapshot.data()["album"] == null
          ? null
          : (snapshot.data()["album"] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
      visualizacoes:
          int.tryParse((snapshot.data()["visualizacoes"] ?? 0).toString()),
      anoCriado: int.tryParse(
          (snapshot.data()["ano_criado"] ?? DateTime.now().year).toString()),
    );
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
        "membros": membros?.map(
          (membro) => membro.toJson(),
        ),
        "album": album,
      };
}
