import 'package:appfood/model/food_model.dart';

class CartModel extends FoodModel {
  int quantidade = 0;
  String restauranteId = '';

  CartModel(
      {id,
      addon,
      imagem,
      preco,
      nome,
      tamanho,
      descricao,
      required this.quantidade,
      required this.restauranteId})
      : super(
          id: id,
          addon: addon,
          imagem: imagem,
          preco: preco,
          nome: nome,
          tamanho: tamanho,
          descricao: descricao,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final food = FoodModel.fromJson(json);
    final quantidade = json['quantidade'];
    final restauranteId = json['restauranteId'];
    return CartModel(
        id: food.id,
        imagem: food.imagem,
        preco: food.preco,
        nome: food.nome,
        addon: food.addon,
        tamanho: food.tamanho,
        descricao: food.descricao,
        quantidade: quantidade,
        restauranteId: restauranteId);
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
    data['quantidade'] = this.quantidade;
    data['resturanteId'] = this.restauranteId;
    return data;
  }
}
