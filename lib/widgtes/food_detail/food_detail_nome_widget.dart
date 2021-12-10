import 'package:appfood/state/food_detail_state.dart';
import 'package:appfood/state/food_lista_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailNomeWidget extends StatelessWidget {
  const FoodDetailNomeWidget(
      {Key? key,
      required this.foodListaStateController,
      required this.foodDetailStateController})
      : super(key: key);

  final FoodListaStateController foodListaStateController;
  final FoodDetailStateController foodDetailStateController;

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
            Text(
              '${foodListaStateController.foodSelecionado.value.nome}',
              style: GoogleFonts.jetBrainsMono(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${foodListaStateController.foodSelecionado.value.preco}',
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
                Obx(() => ElegantNumberButton(
                    initialValue: foodDetailStateController.quantidade.value,
                    minValue: 1,
                    maxValue: 100,
                    color: Colors.amber,
                    onChanged: (value) {
                      // print('Clique $value');
                      foodDetailStateController.quantidade.value =
                          value.toInt();
                    },
                    decimalPlaces: 0))
              ],
            )
          ],
        ),
      ),
    );
  }
}
