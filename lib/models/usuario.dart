import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String id;
  String idStartup;

// Usuario e Senha sao gerenciados pelo firebase

  Usuario({
    this.id,
    this.idStartup,
  });

  factory Usuario.fromDocument(DocumentSnapshot snapshot) {
    return Usuario(
      id: snapshot.id,
      idStartup: snapshot.data()['id_startup'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_startup": idStartup,
      };
}
