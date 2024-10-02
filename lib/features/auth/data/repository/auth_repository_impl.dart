import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_data.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  const AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, User>> login(LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      if (response.token != null && response.user != null) {
        await _localDataSource.cacheToken(response.token!);
        return right(response.user!);
      } else {
        return const Left(Failure('ERROR'));
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
      //any exception (remote-local)
    }
  }

  @override
  Future<Either<Failure, User>> register(
      RegisterRequest registerRequest) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);
      if (response.token != null && response.user != null) {
        _localDataSource.cacheToken(response.token!);
        return right(response.user!);
      } else {
        return const Left(Failure('ERROR'));
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
      //any exception (remote-local)
    }
  }
}
