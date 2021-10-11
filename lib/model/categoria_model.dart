import 'food_model.dart';

class CategoriaModel {
  String key = '';
  String nome = '';
  String imagem = '';
  List<FoodModel> foods = new List<FoodModel>.empty(growable: true);

  CategoriaModel(
      {required this.nome, required this.imagem, required this.foods});

  CategoriaModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    imagem = json['imagem'];    

    if (json['foods'] != null) {
      foods = List<FoodModel>.empty(growable: true);
      json['foods'].forEach((v) {
        foods.add(FoodModel.fromJson(v));
      });
    }    
  }

  Map<String, dynamic> toJson() {
      final data = Map<String, dynamic>();

      data['nome'] = this.nome;
      data['imagem'] = this.imagem;
      data['foods'] = this.foods.map((v) => v.toJson()).toList();
      return data;
    }
}
