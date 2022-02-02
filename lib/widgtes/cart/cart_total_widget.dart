import 'package:appfood/state/cart_state.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/utils/utils.dart';
import 'package:appfood/widgtes/cart/cart_total_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotalWidget extends StatelessWidget {
  CartTotalWidget({Key? key, required this.controller}) : super(key: key);

  final CartStateController controller;
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CartTotalItemWidget(
              texto: 'Total',
              valor: currencyFormat.format(controller.sumCart(mainStateController.restauranteSelecionado.value.restauranteId)),
              isSubTotal: false,
            ),
            Divider(
              thickness: 2,
            ),
            CartTotalItemWidget(
              texto: 'Entrega',
              valor: currencyFormat.format(controller.getEntregaFree(mainStateController.restauranteSelecionado.value.restauranteId)),
              isSubTotal: false,
            ),
            Divider(
              thickness: 2,
            ),
            CartTotalItemWidget(
              texto: 'Sub Total',
              valor: currencyFormat.format(controller.getSubTotal(mainStateController.restauranteSelecionado.value.restauranteId)),
              isSubTotal: false,
            ),
          ],
        ),
      ),
    );
  }
}
