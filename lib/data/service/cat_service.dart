import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/models/cat_model.dart';

part 'cat_service.g.dart';

@RestApi(baseUrl: 'https://cat-fact.herokuapp.com')
abstract class CatService {
  factory CatService(Dio dio, {String baseUrl}) = _CatService;

  @GET('/facts/random?animal_type=cat')
  Future<Cat> getRandomCatInfo();
}
