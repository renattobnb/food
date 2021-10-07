import 'package:appfood/model/categoria_model.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/view_model/categoria_vm/categoria_vm_imp.dart';
import 'package:appfood/widgtes/categoria/lista_categoria_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriaScreen extends StatelessWidget {
  final viewModel = CategoriaViewModelImp();
  final MainStateController mainStateController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorias',
          style: GoogleFonts.jetBrainsMono(color: Colors.black),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: viewModel.displayCategoriaByRestauranteId(mainStateController.restauranteSelecionado.value.restauranteId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var lst = snapshot.data as List<CategoriaModel>;
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: ListaCategoriaWidget(lst),
            );
          }
        },
      ),
    );
  }
}
