import 'dart:convert';
import 'package:appfood/model/cart_model.dart';
import 'package:appfood/model/food_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartStateController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;
  final box = GetStorage();

  getCart(String restauranteId) =>
      cart.where((item) => item.restauranteId == restauranteId);

  addToCart(FoodModel foodModel, String restauranteId, {int quantidade: 1}) async {
    try {
      var cartItem = CartModel(
          id: foodModel.id,
          nome: foodModel.nome,
          descricao: foodModel.descricao,
          imagem: foodModel.imagem,
          preco: foodModel.preco,
          addon: foodModel.addon,
          tamanho: foodModel.tamanho,
          quantidade: quantidade,
          restauranteId: restauranteId);
      if (isExists(cartItem, restauranteId)) {
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

  isExists(CartModel cartItem, String restauranteId) => cart.any((e) => e.id == cartItem.id && e.restauranteId == restauranteId);

  sumCart(String restauranteId) => getCart(restauranteId).length == 0
      ? 0
      : getCart(restauranteId)
          .map((e) => e.preco * e.quantidade)
          .reduce((value, element) => value + element);

  getQuantidade(String restauranteId) => getCart(restauranteId).length == 0
      ? 0
      : getCart(restauranteId)
          .map((e) => e.quantidade)
          .reduce((value, element) => value + element);

  getEntregaFree(String restauranteId) => sumCart(restauranteId) * 0.1; // 10% de desconto

  getSubTotal(String restauranteId) => sumCart(restauranteId) + getEntregaFree(restauranteId);

  clearCart(String restauranteId) {
    getCart(restauranteId).clear();
    salvarDatabase();
  }

  // deleteCart() => box.remove('CART_STORAGE');

  salvarDatabase() => box.write('CART_STORAGE', jsonEncode(cart));
}
