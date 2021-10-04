import 'package:appfood/model/popular_item_model.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/view_model/restaurante_home_vm/restaurante_home_vm.dart';
import 'package:appfood/view_model/restaurante_home_vm/restaurate_home_vm_imp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RestauranteHome extends StatelessWidget {
  final MainStateController mainStateController = Get.find();
  final RestauranteHomeViewModel viewModel = RestauranteHomeViewModelImp();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('${mainStateController.selectedRestaurante.value.nome}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: FutureBuilder(
                  future: viewModel.displayMostPopularByRestauranteId(
                      mainStateController
                          .selectedRestaurante.value.restauranteId),
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
                          Text('Mais Popular...', style: GoogleFonts.jetBrainsMono(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Colors.black45),
                            ),
                            Text('Populares...: ${lstPopular.length}')
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
