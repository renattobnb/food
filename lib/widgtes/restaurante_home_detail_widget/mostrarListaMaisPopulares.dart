import 'package:appfood/model/popular_item_model.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/view_model/restaurante_home_detail_vm/restaurante_home_detail_vm.dart';
import 'package:appfood/widgtes/common/common_widgets.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MostrarMaisPularesWidget extends StatelessWidget {
  const MostrarMaisPularesWidget({
    Key? key,
    required this.viewModel,
    required this.mainStateController,
  }) : super(key: key);

  final RestauranteHomeDetailViewModel viewModel;
  final MainStateController mainStateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: viewModel.displayMostPopularByRestauranteId(
            mainStateController.restauranteSelecionado.value.restauranteId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var lstPopular = snapshot.data as List<PopularItemModel>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mais Popular...',
                  style: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.black45),
                ),
                Expanded(
                  child: LiveList(
                    showItemDuration: Duration(milliseconds: 100),
                    showItemInterval: Duration(milliseconds: 100),
                    reAnimateOnVisibility: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: lstPopular.length,
                    itemBuilder: animationItemBuilder((index) => Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(lstPopular[index].imagem),
                                minRadius: 40,
                                maxRadius: 60,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                lstPopular[index].nome,
                                style: GoogleFonts.jetBrainsMono(),
                              )
                            ],
                          ),
                        )),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
