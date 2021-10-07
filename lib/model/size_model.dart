class SizeModel{
  String nome = '';
  double preco = 0;

  SizeModel({required this.nome, required this.preco});

  SizeModel.fromJson(Map<String, dynamic> json) {
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