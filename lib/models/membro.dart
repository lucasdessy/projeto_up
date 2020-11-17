class Membro {
  String nomeMembro;
  String cargo;
  String fotoUrl;

  Membro({
    this.nomeMembro,
    this.cargo,
    this.fotoUrl,
  });

  factory Membro.fromDocument(Map<dynamic, dynamic> snapshot) {
    return Membro(
      nomeMembro: snapshot["nome_membro"],
      cargo: snapshot["cargo"],
      fotoUrl: snapshot["foto_url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "nome_membro": nomeMembro,
        "cargo": cargo,
        "foto_url": fotoUrl,
      };
}
