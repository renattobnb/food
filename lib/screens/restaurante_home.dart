import 'package:appfood/state/main_state.dart';
import 'package:appfood/view_model/restaurante_home_vm/restaurante_home_vm.dart';
import 'package:appfood/view_model/restaurante_home_vm/restaurate_home_vm_imp.dart';
import 'package:appfood/widgtes/restaurante_home_widget/mostrarListaMaisPopulares.dart';
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
        title: Text('${mainStateController.selectedRestaurante.value.nome}', 
        style: GoogleFonts.jetBrainsMono(color: Colors.black,fontWeight: FontWeight.w900),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 10,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: MostrarMaisPularesWidget(viewModel: viewModel, mainStateController: mainStateController),
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

