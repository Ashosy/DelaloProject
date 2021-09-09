class LoginFailedException implements Exception {
  final String errorText;

  LoginFailedException({required this.errorText});

  @override
  String toString() {
    return errorText;
  }
}

class SignupUserFailedException implements Exception {
  final String errorText;

  SignupUserFailedException({required this.errorText});

  @override
  String toString() {
    return errorText;
  }
}
