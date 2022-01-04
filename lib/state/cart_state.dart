import 'dart:convert';
import 'package:appfood/model/cart_model.dart';
import 'package:appfood/model/food_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartStateController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;
  final box = GetStorage();

  addToCart(FoodModel foodModel, {int quantidade: 1}) async {
    try {
      var cartItem = CartModel(
          id: foodModel.id,
          nome: foodModel.nome,
          descricao: foodModel.descricao,
          imagem: foodModel.imagem,
          preco: foodModel.preco,
          addon: foodModel.addon,
          tamanho: foodModel.tamanho,
          quantidade: 1);
      if (isExists(cartItem)) {
        var foodAtualiza =
            cart.firstWhere((element) => element.id == cartItem.id);
        foodAtualiza.quantidade += quantidade;
      } else {
        cart.add(cartItem);
      }
      var jsonDBEncode = jsonEncode(cart);
      await box.write('CART_STORAGE', jsonDBEncode);
      cart.refresh();
      Get.snackbar('Adicionado com sucesso', 'Atualializado com sucesso!');
    } catch (e) {
      Get.snackbar('Error ao adicionar', e.toString());
    }
  }

  bool isExists(CartModel cartItem) {
    return cart.contains(cartItem);
  }

  sumCart() {
    return cart.length == 0
        ? 0
        : cart
            .map((e) => e.preco * e.quantidade)
            .reduce((value, element) => value + element);
  }

  int getQuantidade() {
    return cart.length == 0
        ? 0
        : cart
            .map((e) => e.quantidade)
            .reduce((value, element) => value + element);
  }

  getEntregaFree() => sumCart() * 0.1; // 10% de desconto

  getSubTotal() => sumCart() + getEntregaFree();
}
