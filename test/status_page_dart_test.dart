import 'package:flutter_test/flutter_test.dart';
import 'package:status_page_dart/status_page_dart.dart';

void main() async {
  const fondeadoraPage = 'db84f7w5kxpz';
  const mobileAppsComponent = '4l3ghrhwf487';

  group('StatusPage Library', () {
    late StatusPage statusPage;

    setUpAll(() {
      statusPage = StatusPage(apiKey: '3d44d3c3-c8c3-4a6d-b5e8-7a83190e018f');
    });

    test('success when getting first page', () async {
      final pages = await statusPage.pages;

      expect(pages.first, isNot(null));
    });

    test('success when getting specific page', () async {
      final page = await statusPage.page(fondeadoraPage);
      expect(page.name, 'Fondeadora');
    });

    test('success when getting component list', () async {
      final page = await statusPage.page(fondeadoraPage);
      expect(page.components, isNot(null));
    });

    test('success when getting Apps móviles component', () async {
      final page = await statusPage.page(fondeadoraPage);
      final component = page.component(mobileAppsComponent);
      expect(component.name, 'Apps móviles');
    });

    test('success when getting Apps móviles component status', () async {
      final page = await statusPage.page(fondeadoraPage);
      final component = page.component(mobileAppsComponent);
      expect(component.status, ComponentStatus.operational);
    });
  });

  group('Edge cases', () {
    late StatusPage statusPage;

    setUpAll(() {
      statusPage = StatusPage(apiKey: 'bad-token');
    });

    test('bad token was provided', () async {
      try {
        await statusPage.pages;
        fail("exception not thrown");
      } catch (e) {
        expect(e, isInstanceOf<AuthException>());
      }
    });
  });
}
