import 'package:appfood/screens/cart_screen.dart';
import 'package:appfood/state/cart_state.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCartButton extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  final CartStateController cartStateController = Get.find();
  AppBarCartButton({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '$titulo',
        style: GoogleFonts.jetBrainsMono(color: Colors.black),
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Obx(()=> Badge(
            position: BadgePosition(top: 0, end: 1),
            animationDuration: Duration(milliseconds: 200),
            animationType: BadgeAnimationType.scale,
            showBadge: true,
            badgeColor: Colors.red,
            badgeContent: Text(
              '${cartStateController.getQuantidade()}',
              style: GoogleFonts.jetBrainsMono(color: Colors.white),
            ),
            child: IconButton(
              onPressed: () => Get.to(()=>CartListaScreen()),
              icon: Icon(Icons.shopping_bag),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
