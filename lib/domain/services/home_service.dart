import 'package:movies_app/domain/entities/tv/tv.dart';

abstract class HomeService {
  Future<List<Tv>> getPopular();
  Future<List<Tv>> getRecommendations();
}
