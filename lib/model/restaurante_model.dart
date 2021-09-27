class RestauranteModel {
  String endereco = '';
  String nome = '';
  String imageUrl = '';
  String paymentUrl = '';
  String phone = '';

  RestauranteModel(
      {this.endereco, this.nome, this.imageUrl, this.paymentUrl, this.phone});

  RestauranteModel.fromJson(Map<String, dynamic> json) {
     endereco = json['endereco'];
         nome = json['nome'];
     imageUrl = json['imageUrl'];
   paymentUrl = json['paymentUrl'];
        phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['endereco'] = this.endereco;
    data['nome'] = this.nome;
    data['imageUrl'] = this.imageUrl;
    data['paymentUrl'] = this.paymentUrl;
    data['phone'] = this.phone;

    return data;
  }
}
