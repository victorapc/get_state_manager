class UsuarioModel {
  int id;
  String nome;
  String email;
  UsuarioModel({
    required this.id,
    required this.nome,
    required this.email,
  });

  UsuarioModel copyWith({
    int? id,
    String? nome,
    String? email,
  }) {
    return UsuarioModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
    );
  }
}
