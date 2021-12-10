import 'package:appfood/model/tamanho_model.dart';
import 'package:appfood/state/food_detail_state.dart';
import 'package:appfood/state/food_lista_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailTamanhoWidget extends StatelessWidget {
  const FoodDetailTamanhoWidget({
    Key? key,
    required this.foodDetailStateController,
    required this.foodListaStateController,
  }) : super(key: key);

  final FoodDetailStateController foodDetailStateController;
  final FoodListaStateController foodListaStateController;

  @override
  Widget build(BuildContext context) {
    return foodListaStateController.foodSelecionado.value.tamanho.length > 0
        ? Card(
            elevation: 12,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => ExpansionTile(
                        title: Text(
                          'Tamanhos',
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        children: foodListaStateController
                            .foodSelecionado.value.tamanho
                            .map((e) => RadioListTile<TamanhoModel>(
                                title: Text(e.nome),
                                value: e,
                                groupValue: foodDetailStateController
                                    .tamanhoSelecionado.value,
                                onChanged: (value) => foodDetailStateController
                                    .tamanhoSelecionado.value = value!))
                            .toList(),),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
