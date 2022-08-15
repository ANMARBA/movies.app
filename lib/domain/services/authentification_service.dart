abstract class AuthentificationService {
  Future<String> authenticate(
      {required String username, required String password});

  Future<void> deleteToken();

  Future<bool> hasToken();

  Future<void> persistToken(String token);
}
