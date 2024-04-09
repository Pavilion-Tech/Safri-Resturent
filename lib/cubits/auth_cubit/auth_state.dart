part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {}
class LoginWrongState extends AuthState {}
class LoginErrorState extends AuthState {}

class SettingsSuccessState extends AuthState {}
class SettingsErrorState extends AuthState {}

