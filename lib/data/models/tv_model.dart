import 'package:movies_app/domain/entities/tv/tv.dart';

class TvModel {
  Tv fromJson(Map<String, dynamic> json) => Tv(
        posterPath: json["poster_path"] as String,
        name: json["name"] as String,
        voteAverage: double.parse(json["vote_average"].toString()),
      );
}
