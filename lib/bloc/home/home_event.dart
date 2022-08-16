import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent([List props = const []]) : super();
}

class HomeStarted extends HomeEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() => 'HomeStarted';
}
