import 'package:appfood/state/cart_state.dart';

abstract class CartViewModel {
  void atualizarCart(CartStateController controller, int index, int value);
}
