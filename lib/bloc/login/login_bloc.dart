import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState?> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(null);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        authenticationBloc.add(LoggedIn(token: token));
      } catch (error) {
        yield LoginFailure();
      }
    }
  }
}
