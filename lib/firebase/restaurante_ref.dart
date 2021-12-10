import 'dart:convert';

import 'package:appfood/const/const.dart';
import 'package:appfood/model/restaurante_model.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<RestauranteModel>> getRestauranteList() async {
  var list = List<RestauranteModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance
  .reference()
  .child(RESTAURANTE_REF)
  .once();
  Map<dynamic, dynamic> values = source.value;
  RestauranteModel? restauranteModel;
  values.forEach((key, value) {
    restauranteModel = RestauranteModel.fromJson(jsonDecode(jsonEncode(value)));
    restauranteModel!.restauranteId = key;
    list.add(restauranteModel!);
  });
  return list;
}
