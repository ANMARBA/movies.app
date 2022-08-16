import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetList extends HomeState {
  final List popular;
  final List recommendations;

  GetList({required this.popular, required this.recommendations});

  @override
  List<Object> get props => [popular, recommendations];

  @override
  String toString() =>
      'GetList { Popular: $popular, Recommendations: $recommendations }';
}

class HomeLoading extends HomeState {}
