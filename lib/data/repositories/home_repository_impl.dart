import 'package:movies_app/domain/repositories/home_repository.dart';
import 'package:movies_app/domain/services/home_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService homeService;
  HomeRepositoryImpl({required this.homeService});

  @override
  Future<List> getPopular() async {
    return await homeService.getPopular();
  }
}
