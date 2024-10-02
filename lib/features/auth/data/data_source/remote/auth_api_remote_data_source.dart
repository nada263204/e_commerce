import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_data.dart';
import 'package:ecommerce/features/auth/data/models/login_response/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response/register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiDataRemoteSource implements AuthRemoteDataSource {
  final _dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true, baseUrl: APIConstants.baseURL));

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndPoint,
        data: loginRequest.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      var message = 'Failed to login';
      if (e is DioException) {
        final response = LoginResponse.fromJson(e.response!.data);
        if (response.message != null) message = response.message!;
      }
      throw RemoteException(message: message);
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _dio.post(
        APIConstants.registerEndPoint,
        data: registerRequest.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      var message = 'Failed to register';
      if (e is DioException) {
        final response = RegisterResponse.fromJson(e.response!.data);
        if (response.message != null) message = response.message!;
      }
      throw RemoteException(message: message);
    }
  }
}
