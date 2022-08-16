import 'package:movies_app/commons/api/api_manager.dart';
import 'package:movies_app/commons/constants/constants.dart';
import 'package:movies_app/data/models/tv_model.dart';
import 'package:movies_app/domain/entities/tv/tv.dart';
import 'package:movies_app/domain/services/home_service.dart';

class HomeServiceImpl implements HomeService {
  final APIManager _apiManager = APIManager();
  final TvModel _tvModel = TvModel();

  @override
  Future<List<Tv>> getPopular() async {
    var data = await _apiManager.getAPICall(
        '${Constants.host}/popular${Constants.apiKey}&language=en-US&page=1');

    final List<Tv> popular = (data["results"] as List)
        .map((res) => _tvModel.fromJson(res as Map<String, dynamic>))
        .toList();

    return Future.value(popular);
  }

  @override
  Future<List<Tv>> getRecommendations() async {
    var data = await _apiManager.getAPICall(
        '${Constants.host}/top_rated${Constants.apiKey}&language=en-US&page=1');

    final List<Tv> recommendations = (data["results"] as List)
        .map((res) => _tvModel.fromJson(res as Map<String, dynamic>))
        .toList();

    return Future.value(recommendations);
  }
}
