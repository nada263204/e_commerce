import 'package:ecommerce/core/api_constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences _sharedPref;
  const AuthSharedPrefLocalDataSource(this._sharedPref);
  @override
  Future<void> cacheToken(String token) async {
    try {
      await _sharedPref.setString(CacheConstants.tokenKey, token);
    } catch (e) {
      throw const LocalException();
    }
  }

  @override
  Future<String> getToken() async {
    try {
      return _sharedPref.getString(CacheConstants.tokenKey)!;
    } catch (e) {
      throw const LocalException();
    }
  }
}
