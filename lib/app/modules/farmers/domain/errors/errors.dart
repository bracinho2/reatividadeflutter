abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  @override
  final String message;
  ConnectionError({required this.message});
}

class AuthException extends Failure {
  @override
  final String message;

  AuthException({
    required this.message,
  });
}

class ErrorLogout extends Failure {
  @override
  final String message;

  ErrorLogout({
    required this.message,
  });
}

class DatasourceError extends Failure {
  @override
  final String message;
  DatasourceError({required this.message});
}

class RepositoryError extends Failure {
  @override
  final String message;
  RepositoryError({required this.message});
}