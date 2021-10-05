import 'dart:ui';

import 'package:appfood/model/popular_item_model.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/view_model/restaurante_home_vm/restaurante_home_vm.dart';
import 'package:appfood/view_model/restaurante_home_vm/restaurate_home_vm_imp.dart';
import 'package:appfood/widgtes/restaurante_home_widget/mostrarListaMaisPopulares.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
        title: Text(
          '${mainStateController.selectedRestaurante.value.nome}',
          style: GoogleFonts.jetBrainsMono(
              color: Colors.black, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: MostrarMaisPularesWidget(
                  viewModel: viewModel,
                  mainStateController: mainStateController),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: FutureBuilder(
                  future: viewModel.displayBestDealsByRestauranteId(
                      mainStateController
                          .selectedRestaurante.value.restauranteId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else {
                      var lstBestDeals =
                          snapshot.data as List<PopularItemModel>;
                      return CarouselSlider(
                          items: lstBestDeals
                              .map((e) => Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Card(
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 5,
                                                  sigmaY: 5,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: e.imagem,
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, err) =>
                                                          Center(
                                                    child: Icon(Icons.image),
                                                  ),
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              donwloadProgress) =>
                                                          Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  '${e.nome}',
                                                  style:
                                                      GoogleFonts.jetBrainsMono(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayAnimationDuration: Duration(seconds: 3),
                              autoPlayCurve: Curves.easeIn,
                              height: double.infinity));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
