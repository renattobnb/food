import 'package:appfood/state/cart_state.dart';
import 'package:appfood/state/main_state.dart';
import 'package:get/get.dart';

import 'cart_view_model.dart';

class CartViewModelImp implements CartViewModel {
  final MainStateController mainStateController = Get.find();

  void atualizarCart(CartStateController controller, int index, int value) {
    controller.cart[index].quantidade = value;
    controller.cart.refresh();
    controller.salvarDatabase();
  }

  void deleteCart(CartStateController controller, int index) {
    controller.cart.removeAt(index);
    controller.cart.refresh();
    controller.salvarDatabase();
  }

  void clearCart(CartStateController controller) {
    controller.clearCart(mainStateController.restauranteSelecionado.value.restauranteId);
  }
}
