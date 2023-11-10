import 'package:my_webapp/auth/data/auth_repository_data.dart';
import 'package:my_webapp/auth/domain/base_auth_repository.dart';
import 'package:my_webapp/auth/domain/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseAuthRepository _repository;
  AuthBloc({BaseAuthRepository? repository})
      : _repository = repository ?? AuthRepositotyData(),
        super(const AuthState()) {
    // _repository.changeUser.listen((user) {
    //   if (user != null) {
    //     add(AuthenticatedEvent(user: user))
    //   }
    // });

    on<AuthenticatedEvent>(onGetData);
  }
  onGetData(AuthenticatedEvent event, Emitter<AuthState> emit) async {
    if (_repository is AuthRepositotyData) {
      emit(state.copyWith(status: AuthStatus.authenticated, user: event.user));
    }
  }
}
