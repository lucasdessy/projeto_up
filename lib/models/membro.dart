class Membro {
  String nomeMembro;
  String cargo;

  Membro({
    this.nomeMembro,
    this.cargo,
  });

  factory Membro.fromDocument(Map<String, dynamic> snapshot) {
    return Membro(
      nomeMembro: snapshot["nome_membro"],
      cargo: snapshot["cargo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "nome_membro": nomeMembro,
        "cargo": cargo,
      };
}
