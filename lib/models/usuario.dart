import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String id;
  String nome;

// Usuario e Senha sao gerenciados pelo firebase

  Usuario({
    this.id,
    this.nome,
  });

  factory Usuario.fromDocument(DocumentSnapshot snapshot) {
    return Usuario(
      id: snapshot.id,
      nome: snapshot.data()['name'] ?? "Sem nome",
    );
  }

  Map<String, dynamic> toJson() => {};
}
