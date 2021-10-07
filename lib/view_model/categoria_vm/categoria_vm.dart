import 'package:appfood/model/categoria_model.dart';

abstract class CategoriaViewModel {
  Future<List<CategoriaModel>> displayCategoriaByRestauranteId(
      String restauranteId);
}
