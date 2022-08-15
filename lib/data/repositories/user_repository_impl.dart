import 'package:movies_app/domain/repositories/user_repository.dart';
import 'package:movies_app/domain/services/authentification_service.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthentificationService authentificationService;
  UserRepositoryImpl({required this.authentificationService});
  @override
  Future<String> authenticate(
      {required String username, required String password}) async {
    final String token = await authentificationService.authenticate(
        username: username, password: password);
    return Future.value(token);
  }

  @override
  Future<void> deleteToken() async {
    await authentificationService.deleteToken();
  }

  @override
  Future<bool> hasToken() async {
    return Future.value(await authentificationService.hasToken());
  }

  @override
  Future<void> persistToken(String token) async {
    await authentificationService.persistToken(token);
  }
}
