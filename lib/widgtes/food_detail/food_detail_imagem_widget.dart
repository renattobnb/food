import 'package:appfood/state/food_lista_state.dart';
import 'package:appfood/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FoodDetailImagemWidget extends StatelessWidget {
  const FoodDetailImagemWidget({ Key? key,
  required this.foodListaStateController }) : super(key: key);

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
                              imageUrl: foodListaStateController
                                  .foodSelecionado.value.imagem,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, err) => Center(
                                child: Icon(Icons.image),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, donwloadProgress) => Center(
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
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
                                FloatingActionButton(
                                  heroTag: 'CART',
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.add_shopping_cart,
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