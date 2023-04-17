part of 'status_page.dart';

class UnexpectedException implements Exception {}

class ConnectionException implements Exception {}

class ResourceNotFoundException implements Exception {
  final String message = "Verify the provided page or component id";
}

class AuthException implements Exception {
  final String message = "The authentication failed, check the provided token";
}

class NoLatestException implements Exception {
  final String message = "Should evaluate not empty before getting latest";
}

class EnhanceYourCalmException implements Exception {
  final String message =
      "Total number of allowed requests has been reached by this lapse";
}
