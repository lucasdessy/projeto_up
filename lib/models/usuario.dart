import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String id;
  String nome;
  String idStartup;

// Usuario e Senha sao gerenciados pelo firebase

  Usuario({
    this.id,
    this.nome,
    this.idStartup,
  });

  factory Usuario.fromDocument(DocumentSnapshot snapshot) {
    return Usuario(
      id: snapshot.id,
      nome: snapshot.data()['nome'] ?? "Sem nome",
      idStartup: snapshot.data()['id_startup'],
    );
  }

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "id_startup": idStartup,
      };
}
