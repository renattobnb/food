import 'package:appfood/model/categoria_model.dart';
import 'package:get/get.dart';

class CategoriaStateController extends GetxController {
  var categoriaSelecionada = CategoriaModel(foods: [], imagem: 'imagem', nome: 'nome').obs;
}
