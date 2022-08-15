import 'package:equatable/equatable.dart';

abstract class AuthentificationEvent extends Equatable {
  const AuthentificationEvent([List props = const []]) : super();
}

class AppStarted extends AuthentificationEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthentificationEvent {
  final String token;

  LoggedIn({required this.token}) : super([token]);

  @override
  List<Object?> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthentificationEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() => 'LoggedOut';
}
