class Contato {
  final int id;
  final String nome;
  final String email;
  final String telefone;
  final String endereco;

  Contato(this.id, this.nome, this.email, this.telefone, this.endereco);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, email: $email, telefone: $telefone, endereco: $endereco}';
  }
}