/// controller in mvc
///  1. in controller : define sign in method
///  2. in sign in method: call authRepository.userLogin(email: email, password: password)
///  3. in userLogin: use REST api 'post' to sign in

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'auth_repository.dart';
import 'authentication_state.dart';

//notifier providers
final authStateProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  final _authRepository = ref.watch(authRepositoryProvider);
  return AuthController(
    ref: ref,
    authRepository: _authRepository,
  );
});

///
class AuthController extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final Ref ref;

  AuthController({required this.authRepository, required this.ref})
      : super(AuthInitialState());

  Future<void> isNeedUpdateVersion() {
    return authRepository.getMinimalVersion().then((value) async {
      if (value != null) {
        debugPrint('Version:  $value');
      } else {
        debugPrint('Version:   *******ERROR****');
      }
    });
  }
}
