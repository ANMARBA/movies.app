import 'package:hive/hive.dart';

class Preferences {
  static const _preferencesBox = '_preferencesBox';
  static const _tokenKey = '_tokenKey';
  final Box<dynamic> _box;

  Preferences._(this._box);

  static Future<Preferences> getInstance() async {
    final box = await Hive.openBox<dynamic>(_preferencesBox);
    return Preferences._(box);
  }

  String? token() => _getValue(_tokenKey);

  Future<void> setToken(String token) => _setValue(_tokenKey, token);

  T _getValue<T>(dynamic key, {T? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);
}
