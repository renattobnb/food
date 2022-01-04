import 'package:appfood/state/cart_state.dart';
import 'package:appfood/utils/utils.dart';
import 'package:appfood/widgtes/cart/cart_total_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({Key? key, required this.controller}) : super(key: key);

  final CartStateController controller;

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
              valor: currencyFormat.format(controller.sumCart()),
              isSubTotal: false,
            ),
            Divider(
              thickness: 2,
            ),
            CartTotalItemWidget(
              texto: 'Entrega',
              valor: currencyFormat.format(controller.getEntregaFree()),
              isSubTotal: false,
            ),
            Divider(
              thickness: 2,
            ),
            CartTotalItemWidget(
              texto: 'Sub Total',
              valor: currencyFormat.format(controller.getSubTotal()),
              isSubTotal: false,
            ),
          ],
        ),
      ),
    );
  }
}
