import 'package:appfood/const/const.dart';
import 'package:appfood/screens/food_detail.dart';
import 'package:appfood/state/cart_state.dart';
import 'package:appfood/state/categoria_state.dart';
import 'package:appfood/state/food_lista_state.dart';
import 'package:appfood/widgtes/common/appbar_cart_button.dart';
import 'package:appfood/widgtes/common/common_widgets.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListaScreen extends StatelessWidget {
  //final viewModel = CategoriaViewModelImp();
  final CategoriaStateController categoriaStateController = Get.find();
  final FoodListaStateController foodListaStateController =
        Get.put(FoodListaStateController());
  final CartStateController cartStateController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCartButton(
        titulo: '${categoriaStateController.categoriaSelecionada.value.nome}',
      ),
      body: Column(
        children: [
          Expanded(
            child: LiveList(
                showItemInterval: Duration(milliseconds: 100),
                showItemDuration: Duration(milliseconds: 100),
                reAnimateOnVisibility: true,
                scrollDirection: Axis.vertical,
                itemCount: categoriaStateController
                    .categoriaSelecionada.value.foods.length,
                itemBuilder: animationItemBuilder(
                  (index) => InkWell(
                    onTap: () {
                      foodListaStateController.foodSelecionado.value =
                          categoriaStateController
                              .categoriaSelecionada.value.foods[index];
                      Get.to(() => FoodDetailScreen());
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 6 * 2,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: categoriaStateController
                                  .categoriaSelecionada
                                  .value
                                  .foods[index]
                                  .imagem,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, err) => Center(
                                child: Icon(Icons.image),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, donwloadProgress) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Color(COLOR_OVERLAY),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '${categoriaStateController.categoriaSelecionada.value.foods[index].nome}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                              ),
                                              Text(
                                                'Preço: \R${categoriaStateController.categoriaSelecionada.value.foods[index].preco}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.add_shopping_cart,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () => cartStateController.addToCart(categoriaStateController.categoriaSelecionada.value.foods[index])),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
