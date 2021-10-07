import 'package:appfood/firebase/categoria_ref.dart';
import 'package:appfood/model/categoria_model.dart';

import 'categoria_vm.dart';

class CategoriaViewModelImp implements CategoriaViewModel {
  @override
  Future<List<CategoriaModel>> displayCategoriaByRestauranteId(
      String restauranteId) {
    return getCategoriaByRestauranteId(restauranteId);
  }
}
