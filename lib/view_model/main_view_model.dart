import 'package:appfood/model/restaurante_model.dart';

abstract class MainViewModel{
  Future<List<RestauranteModel>> displayRestauranteList();
}