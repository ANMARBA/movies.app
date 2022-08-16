import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/tv/tv.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetList extends HomeState {
  final List<Tv> popular;
  final List<Tv> recommendations;

  GetList({required this.popular, required this.recommendations});

  @override
  List<Object> get props => [popular, recommendations];

  @override
  String toString() =>
      'GetList { Popular: $popular, Recommendations: $recommendations }';
}

class HomeLoading extends HomeState {}
