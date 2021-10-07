import 'food_model.dart';

class CategoriaModel {
  String key = '';
  String nome = '';
  String imagem = '';
  List<FoodModel> foods = List<FoodModel>.empty(growable: true);

  CategoriaModel(
      {required this.key,
      required this.foods,
      required this.imagem,
      required this.nome});
 
  
   CategoriaModel.fromJson(Map<String, dynamic> json) {
    imagem = json['imagem'];
    nome = json['nome'];
    
      if (json['foods'] != null) {
      final foods = List<FoodModel>.empty(growable: true);
      json['foods'].forEach((v) {
        foods.add(FoodModel.fromJson(v));
      });
    }

    Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();

    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['foods'] = this.foods.map((e) => e.toJson()).toList();
    
    return data;
  }
  
      
  }

}
