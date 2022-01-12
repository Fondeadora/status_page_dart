part of 'status_page.dart';

class ConnectionException implements Exception {}

class ResourceNotFoundException implements Exception {
  final String message = "Verify the provided page or component id";
}

class AuthException implements Exception {
  final String message = "The authentication failed, check the provided token";
}
