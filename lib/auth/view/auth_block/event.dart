part of 'blok.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthenticatedEvent extends AuthEvent{
  final BaseUser user;
  const AuthenticatedEvent({required this.user});
}
