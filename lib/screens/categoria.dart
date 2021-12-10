import 'package:appfood/model/categoria_model.dart';
import 'package:appfood/state/categoria_state.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/view_model/categoria_vm/categoria_vm_imp.dart';
import 'package:appfood/widgtes/categoria/lista_categoria_widget.dart';
import 'package:appfood/widgtes/common/appbar_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriaScreen extends StatelessWidget {
 
  final viewModel = CategoriaViewModelImp();
  final MainStateController mainStateController = Get.find();
  final CategoriaStateController categoriaStateController =
      Get.put(CategoriaStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCartButton(titulo: 'Categoria'),
      body: FutureBuilder(
        future: viewModel.displayCategoriaByRestauranteId(
            mainStateController.restauranteSelecionado.value.restauranteId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var lst = snapshot.data as List<CategoriaModel>;
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: ListaCategoriaWidget(
                lst,categoriaStateController
              ),
            );
          }
        },
      ),
    );
  }
}
