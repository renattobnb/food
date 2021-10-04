import 'package:appfood/model/popular_item_model.dart';

abstract class RestauranteHomeViewModel {
  Future<List<PopularItemModel>> displayMostPopularByRestauranteId(
      String restauranteId);
}
