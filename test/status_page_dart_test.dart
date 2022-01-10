import 'package:flutter_test/flutter_test.dart';
import 'package:status_page_dart/status_page_dart.dart';

void main() async {
  var statusPage = StatusPage(apiKey: '3d44d3c3-c8c3-4a6d-b5e8-7a83190e018f');
  await statusPage.init;

  final page = statusPage.page('db84f7w5kxpz');

  group('[StatusPageDart] Test | page: ${page.name}', () {
    final component = page.component('4l3ghrhwf487');

    test(
      'success when component ${component.name} is ${component.status}',
      () {
        expect(component.status, 'operational');
      },
    );
  });
}
