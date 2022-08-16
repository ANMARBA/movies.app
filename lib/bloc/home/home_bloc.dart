import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState?> {
  final HomeRepository homeRepository;
  late List _popular = [];
  late List _recommendations = [];

  List get popular => _popular;
  List get recommendations => _recommendations;

  HomeBloc({required this.homeRepository}) : super(null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStarted) {
      yield HomeLoading();
      _popular = await homeRepository.getPopular();
      _recommendations = await homeRepository.getPopular();
      yield GetList(popular: popular, recommendations: recommendations);
    }
  }
}
