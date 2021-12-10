import 'package:appfood/state/food_lista_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailDescricaoWidget extends StatelessWidget {
  const FoodDetailDescricaoWidget(
      {Key? key, required this.foodListaStateController})
      : super(key: key);

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
            RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (value) {}),
            SizedBox(
              height: 10,
            ),
            Text(
              '${foodListaStateController.foodSelecionado.value.descricao}',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.blueGrey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
