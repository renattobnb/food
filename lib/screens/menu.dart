import 'package:appfood/view_model/menu_vm/menu_vw_imp.dart';
import 'package:appfood/widgtes/menu_home_widget/menu_categoria_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:appfood/const/const.dart';

class MenuScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  final viewModel = MenuViewModelImp();

  MenuScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_MENU_BG),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: Color(COLOR_ICON_DRAWER),
                          child: Icon(
                            Icons.restaurant,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () => zoomDrawerController.toggle!(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.jetBrainsMono(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            MenuCategoriaWidget(
              icon: Icons.list,
              nomeMenu: 'Categoria',
              callback: viewModel.navigateCategorias,
            ),
          ],
        ),
      ),
    );
  }
}
