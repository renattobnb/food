import 'dart:convert';
import 'package:appfood/const/const.dart';
import 'package:appfood/model/categoria_model.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<CategoriaModel>> getCategoriaByRestauranteId(String restauranteId) async {
  var list = List<CategoriaModel>.empty(growable: true);
  var source = await
   FirebaseDatabase.instance
   .reference().child(RESTAURANTE_REF)
   .child(restauranteId)
   .child(CATEGORIA_REF).once();
  Map<dynamic, dynamic> values = source.value;
  values.forEach((key, value) {
    list.add(CategoriaModel.fromJson(jsonDecode(jsonEncode(value))));
  });
  return list;
}