import 'package:status_page_dart/status_page_dart.dart';

void main() {
  final statusPage = StatusPage();
  final status = statusPage.page('page').component('component').status;
  print(status);
}
