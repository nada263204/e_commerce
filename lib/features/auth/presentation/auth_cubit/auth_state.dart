part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailed extends AuthState {
  final String message;
  LoginFailed(this.message);
}

class RegisterSuccess extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterFailed extends AuthState {
  final String message;
  RegisterFailed(this.message);
}
