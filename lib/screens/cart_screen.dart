import 'package:appfood/state/cart_state.dart';
import 'package:appfood/view_model/cart_vm/cart_view_model_imp.dart';
import 'package:appfood/widgtes/cart/cart_image_widget.dart';
import 'package:appfood/widgtes/cart/cart_info_widget.dart';
import 'package:appfood/widgtes/cart/cart_total_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartListaScreen extends StatelessWidget {
  final box = GetStorage();
  final CartStateController controller = Get.find();
  final CartViewModelImp cartViewModelImp = CartViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        actions: [
          controller.getQuantidade() > 0
              ? IconButton(onPressed: () {}, icon: Icon(Icons.clear))
              : Container()
        ],
      ),
      body: controller.getQuantidade() > 0
          ? Obx(() => Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: controller.cart.length,
                          itemBuilder: (context, index) => Slidable(
                                child: Card(
                                  elevation: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: CartImagemWidget(
                                              cartModel: controller.cart[index],
                                              controller: controller),
                                        ),
                                        Expanded(
                                            flex: 6,
                                            child: CartInfo(
                                              cartModel: controller.cart[index],
                                            )),
                                        Center(
                                          child: ElegantNumberButton(
                                              initialValue: controller
                                                  .cart[index].quantidade,
                                              minValue: 1,
                                              maxValue: 100,
                                              color: Colors.amber,
                                              onChanged: (value) {
                                                // atualiza a quantidade
                                                cartViewModelImp.atualizarCart(
                                                    controller,
                                                    index,
                                                    value.toInt());
                                              },
                                              decimalPlaces: 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: 'Excluir',
                                    icon: Icons.delete,
                                    color: Colors.red,
                                    onTap: () {},
                                  )
                                ],
                              ))),
                              CartTotalWidget(controller: controller),
                              
                              
                ],
              ))
          : Center(
              child: Text('Seu carrinho esta vazio!'),
            ),
    );
  }

}
