import 'package:appfood/model/add_model.dart';
import 'package:appfood/model/tamanho_model.dart';
import 'package:get/get.dart';

class FoodDetailStateController extends GetxController {
  var quantidade = 1.obs;
  var tamanhoSelecionado = TamanhoModel(nome: 'nome', preco: 0).obs;
  var itensAddSelecionado = List<AddonModel>.empty(growable: true).obs;
}
