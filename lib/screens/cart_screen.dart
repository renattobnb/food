import 'package:appfood/state/cart_state.dart';
import 'package:appfood/widgtes/cart/cart_image_widget.dart';
import 'package:appfood/widgtes/cart/cart_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartListaScreen extends StatelessWidget {
  final box = GetStorage();
  final CartStateController controller = Get.find();

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
                                            ))
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
                              )))
                ],
              ))
          : Center(
              child: Text('Seu carrinho esta vazio!'),
            ),
    );
  }
}
