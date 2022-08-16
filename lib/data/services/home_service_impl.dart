import 'package:movies_app/commons/api/api_manager.dart';
import 'package:movies_app/commons/constants/constants.dart';
import 'package:movies_app/domain/services/home_service.dart';

class HomeServiceImpl implements HomeService {
  final APIManager _apiManager = APIManager();

  @override
  Future<List> getPopular() async {
    var data = await _apiManager
        .getAPICall('${Constants.host}/popular${Constants.apiKey}');

    // final List<Country> countries = (data as List)
    //     .map((res) => _countryModel.fromJson(res as Map<String, dynamic>))
    //     .toList();

    return Future.value(data["results"]);
  }
}
