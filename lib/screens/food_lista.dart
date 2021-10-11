import 'package:appfood/const/const.dart';
import 'package:appfood/state/categoria_state.dart';
import 'package:appfood/widgtes/common/common_widgets.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListaScreen extends StatelessWidget {
  //final viewModel = CategoriaViewModelImp();
  final CategoriaStateController categoriaStateController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${categoriaStateController.categoriaSelecionada.value.nome}',
          style: GoogleFonts.jetBrainsMono(color: Colors.black),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
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
            itemBuilder: animationItemBuilder((index) => InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/6*2,
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
                                                      Icons.favorite_border,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {}),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Icon(
                                                  Icons.add_shopping_cart,
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
                )),
          ))
        ],
      ),
    );
  }
}

