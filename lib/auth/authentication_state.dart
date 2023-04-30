abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthUnSuccessOnboardingState extends AuthState {
  const AuthUnSuccessOnboardingState();
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState();
}

class AuthUpdateVersionState extends AuthState {
  const AuthUpdateVersionState();
}

class AuthErrorState extends AuthState {
  final String? message;
  const AuthErrorState({this.message});
}

class AuthUnauthenticatedState extends AuthState {
  const AuthUnauthenticatedState();
}
