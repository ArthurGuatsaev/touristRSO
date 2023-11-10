import 'package:my_webapp/favorite/data/favorite_hive_service.dart';
import 'package:my_webapp/favorite/domain/base_favorite_repository.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';

class FavoriteRepositoryData extends BaseFavoriteRepository {
  final FavoriteHiveService _favoriteHiveService;
  FavoriteRepositoryData({FavoriteHiveService? favoriteHiveService})
      : _favoriteHiveService = favoriteHiveService ?? FavoriteHiveService();
  @override
  Future<List<BaseGeneralModel>> getFaivoriteModel() async {
    return _favoriteHiveService.getFaivoriteModel();
  }

  @override
  Future<void> saveModel({required BaseGeneralModel model}) async {
    _favoriteHiveService.saveModel(model: model);
  }
}
