import 'package:appfood/model/size_model.dart';

import 'add_model.dart';

class FoodModel {
  String descricao = '';
  String id = '';
  String nome = '';
  String imagem = '';
  double preco = 0;
  List<SizeModel> size = List<SizeModel>.empty(growable: true);
  List<AddonModel> addon = List<AddonModel>.empty(growable: true);

  FoodModel(
      {required this.descricao,
      required this.id,
      required this.addon,
      required this.imagem,
      required this.preco,
      required this.nome,
      required this.size});

  FoodModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    id = json['id'];
    imagem = json['imagem'];
    descricao = json['descricao'];
    preco = double.parse(json['preco'].toString());
    if (json['addon'] != null) {
      final adicionar = List<AddonModel>.empty(growable: true);
      json['addon'].forEach((v) {
        adicionar.add(AddonModel.fromJson(v));
      });
    }

    if (json['tamanho'] != null) {
      final size = List<SizeModel>.empty(growable: true);
      json['tamanho'].forEach((v) {
        size.add(SizeModel.fromJson(v));
      });
    }
  }

    Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();

    data['nome'] = this.nome;
    data['preco'] = this.preco;
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    data['tamanho'] = this.size.map((e) => e.toJson()).toList();
    data['addon'] = this.addon.map((e) => e.toJson()).toList();

    return data;
  }
}
