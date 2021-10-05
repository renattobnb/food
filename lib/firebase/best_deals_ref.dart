
import 'dart:convert';
import 'package:appfood/const/const.dart';
import 'package:appfood/model/popular_item_model.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<PopularItemModel>> getBestDealByRestauranteId(String restauranteId) async {
  var list = List<PopularItemModel>.empty(growable: true);
  var source = await
   FirebaseDatabase.instance
   .reference().child(RESTAURANTE_REF)
   .child(restauranteId)
   .child(BEST_DEALS_REF).once();
  Map<dynamic, dynamic> values = source.value;
  values.forEach((key, value) {
    list.add(PopularItemModel.fromJson(jsonDecode(jsonEncode(value))));
  });
  return list;
}