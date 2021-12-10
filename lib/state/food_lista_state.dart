import 'package:appfood/model/food_model.dart';
import 'package:get/get.dart';



class FoodListaStateController extends GetxController {
  var foodSelecionado = FoodModel(
    descricao: 'descricao',
    id: 'id',
    nome: 'nome',
    imagem: 'imagem',
    preco: 0,
    tamanho: [],
    addon: []).obs;
  
}
