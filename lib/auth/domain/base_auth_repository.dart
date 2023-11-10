abstract class BaseAuthRepository with EmailAndPasswordFirebase, WithoutNetworkHive {}


mixin EmailAndPasswordFirebase {
  Future<void> registrate({required String email, required String name, required String password});
  Future<void> sign({required String email, required String password});
}

mixin WithoutNetworkHive {
  Future<Map<String, String>> isAuth();
  Future<void> saveAuthData({required String name, required String email});
}