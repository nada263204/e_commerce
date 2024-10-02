import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => 'My base url';

  @lazySingleton
  Dio get dio => Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: APIConstants.baseURL,
      ));

  // ignore: invalid_annotation_target
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
