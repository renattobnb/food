import 'package:appfood/model/popular_item_model.dart';

abstract class RestauranteHomeDetailViewModel {
  Future<List<PopularItemModel>> displayMostPopularByRestauranteId(
      String restauranteId);
  Future<List<PopularItemModel>> displayBestDealsByRestauranteId(
      String restauranteId);
}
