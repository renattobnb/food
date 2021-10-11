class TamanhoModel{
  String nome = '';
  double preco = 0;

  TamanhoModel({required this.nome, required this.preco});

  TamanhoModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'] == null ? '' : json['nome'];
    preco = double.parse(json['preco'].toString());
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();

    data['nome'] = this.nome;
    data['preco'] = this.preco;

    return data;
  }
}