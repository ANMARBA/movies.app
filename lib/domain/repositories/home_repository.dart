import 'package:movies_app/domain/entities/tv/tv.dart';

abstract class HomeRepository {
  Future<List<Tv>> getPopular();
  Future<List<Tv>> getRecommendations();
}
