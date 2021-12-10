import 'package:appfood/state/food_detail_state.dart';
import 'package:appfood/state/food_lista_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailAdd extends StatelessWidget {
  const FoodDetailAdd({ Key? key,
  required this.foodDetailStateController,
  required this.foodListaStateController }) : super(key: key);
  
  final FoodDetailStateController foodDetailStateController;
  final FoodListaStateController foodListaStateController;
   
  @override
  Widget build(BuildContext context) {
    return Card(
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
                                    'Adicionar',
                                    style: GoogleFonts.jetBrainsMono(
                                        color: Colors.blueGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  children: [ 
                                    Wrap(
                                      children: foodListaStateController
                                               .foodSelecionado
                                               .value
                                               .addon
                                               .map((e) => Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: ChoiceChip(
                                                  label: Text(e.nome),
                                                  selected: foodDetailStateController.itensAddSelecionado.contains(e),
                                                  selectedColor: Colors.yellow,
                                                  onSelected: (selecionado) => selecionado ?
                                                  foodDetailStateController.itensAddSelecionado.add(e) :
                                                  foodDetailStateController.itensAddSelecionado.remove(e)),
                                                  ))
                                          .toList(),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}