part of 'blok.dart';

class AuthState {
  final BaseUser user;
  final AuthStatus status;
  final String failure;
  const AuthState({this.user = const BaseUser(), this.status = AuthStatus.loading, this.failure = ''});

  AuthState copyWith({
    BaseUser? user,
    AuthStatus? status,
    String? failure, 
  }) {
    return AuthState(
      user: user ?? this.user,
      failure: failure ?? this.failure,
      status: status ?? this.status
    );
  }
}

enum AuthStatus {
  authenticated, unauthenticated, loading
}