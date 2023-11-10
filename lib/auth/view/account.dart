import 'package:flutter/material.dart';
import 'package:my_webapp/auth/view/auth_block/blok.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountAuth extends StatelessWidget {
  const AccountAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            previous.status != current.status || previous.user != current.user,
        builder: (context, state) {
          switch (state.status) {
            case AuthStatus.authenticated:
              return const AuthenticatedWidget();
            case AuthStatus.loading:
              return const CircularProgressIndicator();
            case AuthStatus.unauthenticated:
              return const UnAuthenticatedWidget();
          }
        });
  }
}

class UnAuthenticatedWidget extends StatelessWidget {
  const UnAuthenticatedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('');
  }
}

class AuthenticatedWidget extends StatelessWidget {
  const AuthenticatedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CircleAvatar(), Text('')],
    );
  }
}
