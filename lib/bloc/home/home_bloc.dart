import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/tv/tv.dart';

import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState?> {
  final HomeRepository homeRepository;
  late List<Tv> _popular = [];
  late List<Tv> _recommendations = [];

  List<Tv> get popular => _popular;
  List<Tv> get recommendations => _recommendations;

  HomeBloc({required this.homeRepository}) : super(null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStarted) {
      yield HomeLoading();
      _popular = await homeRepository.getPopular();
      _recommendations = await homeRepository.getRecommendations();
      yield GetList(popular: popular, recommendations: recommendations);
    }
  }
}
