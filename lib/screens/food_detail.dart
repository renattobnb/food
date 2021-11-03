import 'package:appfood/state/categoria_state.dart';
import 'package:appfood/state/food_lista_state.dart';
import 'package:appfood/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailScreen extends StatelessWidget {
  final CategoriaStateController categoriaStateController = Get.find();
  final FoodListaController foodListaController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title:
                      Text('${foodListaController.foodSelecionado.value.nome}',
                      style: GoogleFonts.jetBrainsMono(color:Colors.black),),
                      elevation: 10,
                      backgroundColor: Colors.white,
                      iconTheme: IconThemeData(color: Colors.black),
                      foregroundColor: Colors.black,
                      bottom: PreferredSize(
                        preferredSize: Size.square(foodDetailImagemAreaSize(context)),
                        child: Column(children: [
                          Container(width: double.infinity,
                          height: foodDetailImagemAreaSize(context)*0.9,
                          child:  CachedNetworkImage(
                            imageUrl: categoriaStateController
                                .categoriaSelecionada.value.imagem,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, err) => Center(
                              child: Icon(Icons.image),
                            ),
                            progressIndicatorBuilder:
                                (context, url, donwloadProgress) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),)
                        ],),
                      ),

                )
              ];
            },
            body: Container(
                child: Center(
              child: Text('Food Detail'),
            ))),
      ),
    );
  }
}
