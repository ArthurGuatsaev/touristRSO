import 'package:my_webapp/auth/data/service/firebase/email_password.dart';
import 'package:my_webapp/auth/data/service/hive/hive_auth.dart';
import 'package:my_webapp/auth/domain/base_auth_repository.dart';

class AuthRepositotyData extends BaseAuthRepository
    with EmailAndPasswordFirebaseData, WithoutNetworkHiveData {}

mixin EmailAndPasswordFirebaseData {
  final EmailAndPasswordFirebaseService _emailAndPasswordFirebaseService =
      EmailAndPasswordFirebaseService();
  Future<void> registrate(
      {required String email,
      required String name,
      required String password}) async {
    _emailAndPasswordFirebaseService.registrate(
        email: email, name: name, password: password);
  }

  Future<void> sign({required String email, required String password}) async {
    _emailAndPasswordFirebaseService.sign(email: email, password: password);
  }
}

mixin WithoutNetworkHiveData {
  final HiveIsAuthService _hiveIsAuthService = HiveIsAuthService();
  Future<Map<String, String>> isAuth() async {
    return _hiveIsAuthService.isAuth();
  }

  Future<void> saveAuthData(
      {required String name, required String email}) async {
    _hiveIsAuthService.saveAuthData(name: name, email: email);
  }
}
