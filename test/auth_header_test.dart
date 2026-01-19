import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:status_page/status_page.dart';

void main() {
  group('StatusPageApi auth header', () {
    test('sets Authorization header with OAuth prefix', () {
      final dio = Dio();
      StatusPageApi(dio, 'my-key');

      expect(dio.options.headers['Authorization'], 'OAuth my-key');
    });

    test('does not set Authorization header when apiKey is empty', () {
      final dio = Dio();
      StatusPageApi(dio, '');

      expect(dio.options.headers.containsKey('Authorization'), isFalse);
    });
  });
}
