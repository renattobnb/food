import 'package:appfood/model/tamanho_model.dart';
import 'add_model.dart';

class FoodModel {
  String descricao = '';
  String id = '';
  String nome = '';
  String imagem = '';
  double preco = 0;
  List<TamanhoModel> tamanho = List<TamanhoModel>.empty(growable: true);
  List<AddonModel> addon = List<AddonModel>.empty(growable: true);

  FoodModel(
      {required this.descricao,
      required this.id,
      required this.addon,
      required this.imagem,
      required this.preco,
      required this.nome,
      required this.tamanho});

  FoodModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    id = json['id'];
    imagem = json['imagem'];
    descricao = json['descricao'];
    preco = double.parse(json['preco'].toString());
   
    if (json['addon'] != null) {
      final addon = List<AddonModel>.empty(growable: true);
      json['addon'].forEach((v) {
        addon.add(AddonModel.fromJson(v));
      });
    }

    if (json['tamanho'] != null) {
      final tamanho = List<TamanhoModel>.empty(growable: true);
      json['tamanho'].forEach((t) {
        tamanho.add(TamanhoModel.fromJson(t));
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
    data['tamanho'] = this.tamanho.map((e) => e.toJson()).toList();
    data['addon'] = this.addon.map((e) => e.toJson()).toList();

    return data;
  }
}
