import 'package:movies_app/commons/utils/preferences.dart';
import 'package:movies_app/domain/services/authentification_service.dart';

class AuthentificationServiceImpl implements AuthentificationService {
  @override
  Future<String> authenticate(
      {required String username, required String password}) async {
    if ((username == 'maria' && password == 'password') ||
        (username == 'pedro' && password == '123456')) {
      return Future.value('token');
    }

    return Future.error('');
  }

  @override
  Future<void> persistToken(String token) async {
    final prefs = await Preferences.getInstance();

    await prefs.setToken(token);
  }

  @override
  Future<void> deleteToken() async {
    final prefs = await Preferences.getInstance();

    await prefs.setToken('');
  }

  @override
  Future<bool> hasToken() async {
    final prefs = await Preferences.getInstance();

    final String token = prefs.token() ?? '';

    final bool _hasToken = token.isNotEmpty;

    return Future.value(_hasToken);
  }
}
