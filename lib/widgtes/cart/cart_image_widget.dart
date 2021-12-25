import 'package:appfood/model/cart_model.dart';
import 'package:appfood/state/cart_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartImagemWidget extends StatelessWidget {
  const CartImagemWidget({Key? key, required this.controller, required this.cartModel})
      : super(key: key);

  final CartStateController controller;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: cartModel.imagem,
      fit: BoxFit.cover,
      errorWidget: (context, url, err) => Center(
        child: Icon(Icons.image),
      ),
      progressIndicatorBuilder: (context, url, donwloadProgress) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
