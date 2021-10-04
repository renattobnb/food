import 'package:appfood/firebase/popular_ref.dart';
import 'package:appfood/model/popular_item_model.dart';
import 'package:appfood/view_model/restaurante_home_vm/restaurante_home_vm.dart';

class RestauranteHomeViewModelImp implements RestauranteHomeViewModel {
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestauranteId(
      String restauranteId) {
    return getMostPopularByRestauranteId(restauranteId);
  }
}
