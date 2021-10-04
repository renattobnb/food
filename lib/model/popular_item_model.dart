class PopularItemModel {
  String food_id = '', nome = '', imagem = '', menu_id ='';

  PopularItemModel({required this.food_id, required this.nome, required this.imagem, required this.menu_id});

   PopularItemModel.fromJson(Map<String, dynamic> json) {
     food_id = json['food_id'];
       nome = json['nome'];
     imagem = json['imagem']; 
     menu_id = json['menu_id'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['food_id'] = this.food_id;
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['menu_id'] = this.menu_id;
    

    return data;
  }
}
