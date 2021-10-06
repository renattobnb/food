import 'package:appfood/firebase/best_deals_ref.dart';
import 'package:appfood/firebase/popular_ref.dart';
import 'package:appfood/model/popular_item_model.dart';
import 'package:appfood/view_model/restaurante_home_detail_vm/restaurante_home_detail_vm.dart';

class RestauranteHomeDetailViewModelImp implements RestauranteHomeDetailViewModel {
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestauranteId(
      String restauranteId) {
    return getMostPopularByRestauranteId(restauranteId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealsByRestauranteId(
      String restauranteId) {
    return getBestDealByRestauranteId(restauranteId);
  }
}
