import 'package:appfood/state/cart_state.dart';
import 'package:appfood/state/food_detail_state.dart';
import 'package:appfood/state/food_lista_state.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailImagemWidget extends StatelessWidget {
  final CartStateController cartStateController = Get.find();
  final FoodDetailStateController foodDetailStateController = Get.find();
  final MainStateController mainStateController = Get.find();

  FoodDetailImagemWidget({Key? key, required this.foodListaStateController})
      : super(key: key);

  final FoodListaStateController foodListaStateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: foodDetailImagemAreaSize(context) * 0.9,
          child: Hero(
            tag: foodListaStateController.foodSelecionado.value.nome,
            child: CachedNetworkImage(
              imageUrl: foodListaStateController.foodSelecionado.value.imagem,
              fit: BoxFit.cover,
              errorWidget: (context, url, err) => Center(
                child: Icon(Icons.image),
              ),
              progressIndicatorBuilder: (context, url, donwloadProgress) =>
                  Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.8, 1.0),
          heightFactor: 0.5,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: 'CART',
                  onPressed: () => cartStateController.addToCart(
                      foodListaStateController.foodSelecionado.value,
                      mainStateController.restauranteSelecionado.value.restauranteId,
                      quantidade: foodDetailStateController.quantidade.value),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 10,
                ),
                FloatingActionButton(
                  heroTag: 'FAV',
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
