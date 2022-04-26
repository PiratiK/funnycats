import '../../data/models/cat_model.dart';
import '../../data/service/cat_service.dart';

class CatRepository {
  final CatService catService;

  const CatRepository({
    required this.catService,
  });

  Future<Cat> getRandomCatInfo() async => await catService.getRandomCatInfo();
}
