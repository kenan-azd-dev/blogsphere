part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class UserSignedUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  UserSignedUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

final class UserLoggedInEvent extends AuthEvent {
  final String email;
  final String password;

  UserLoggedInEvent({
    required this.email,
    required this.password,
  });
}

final class IsUserLoggedInEvent extends AuthEvent {}