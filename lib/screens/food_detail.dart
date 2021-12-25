import 'package:appfood/state/cart_state.dart';
import 'package:appfood/state/categoria_state.dart';
import 'package:appfood/state/food_detail_state.dart';
import 'package:appfood/state/food_lista_state.dart';
import 'package:appfood/utils/utils.dart';
import 'package:appfood/widgtes/food_detail/food_detail_add_widget.dart';
import 'package:appfood/widgtes/food_detail/food_detail_descricao_widget.dart';
import 'package:appfood/widgtes/food_detail/food_detail_imagem_widget.dart';
import 'package:appfood/widgtes/food_detail/food_detail_nome_widget.dart';
import 'package:appfood/widgtes/food_detail/food_detail_tamanho_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailScreen extends StatelessWidget {
  final CategoriaStateController categoriaStateController = Get.find();
  final FoodListaStateController foodListaStateController = Get.find();
  final FoodDetailStateController foodDetailStateController =
      Get.put(FoodDetailStateController());
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  '${foodListaStateController.foodSelecionado.value.nome}',
                  style: GoogleFonts.jetBrainsMono(color: Colors.black),
                ),
                elevation: 10,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                foregroundColor: Colors.black,
                bottom: PreferredSize(
                  preferredSize: Size.square(foodDetailImagemAreaSize(context)),
                  child: FoodDetailImagemWidget(
                    foodListaStateController: foodListaStateController,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FoodDetailNomeWidget(
                      foodListaStateController: foodListaStateController,
                      foodDetailStateController: foodDetailStateController),
                  FoodDetailDescricaoWidget(
                      foodListaStateController: foodListaStateController),
                  FoodDetailTamanhoWidget(
                      foodDetailStateController: foodDetailStateController,
                      foodListaStateController: foodListaStateController),
                  FoodDetailAdd(
                    foodDetailStateController: foodDetailStateController,
                    foodListaStateController: foodListaStateController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
