import 'package:ecommerce/features/auth/data/models/login_data.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase, this._registerUseCase) : super(AuthInitial());
  final Login _loginUseCase;
  final Register _registerUseCase;

  Future<void> register(RegisterRequest registerRequest) async {
    emit(RegisterLoading());

    final result = await _registerUseCase(registerRequest);
    result.fold(
      (failure) => emit(RegisterFailed(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());

    final result = await _loginUseCase(loginRequest);
    result.fold(
      (failure) => emit(LoginFailed(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
