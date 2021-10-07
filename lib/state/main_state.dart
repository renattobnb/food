import 'package:appfood/model/restaurante_model.dart';
import 'package:get/get.dart';

class MainStateController extends GetxController {
  var restauranteSelecionado = RestauranteModel(
          endereco: 'endereco',
          nome: 'nome',
          paymentUrl: 'paymentUrl',
          imageUrl: 'imageUrl',
          phone: 'phone')
      .obs;
}
