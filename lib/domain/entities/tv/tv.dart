import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String posterPath;
  final String name;
  final double voteAverage;

  const Tv({
    required this.posterPath,
    required this.name,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [posterPath, name, voteAverage];
}
