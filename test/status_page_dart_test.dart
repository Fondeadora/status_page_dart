import 'package:flutter_test/flutter_test.dart';
import 'package:status_page_dart/status_page.dart';

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
      expect(component.status, isNot(null));
    });

    test('success getting unresolved incidents', () async {
      final unresolvedIncidents = await statusPage.incidents(fondeadoraPage);
      expect(unresolvedIncidents, isNot(null));
    });

    test('success getting latest unresolved incident', () async {
      final unresolvedIncidents = await statusPage.incidents(fondeadoraPage);
      if (unresolvedIncidents.isNotEmpty) {
        final latestIncident = unresolvedIncidents.latest;
        expect(latestIncident, isNot(null));
      }else{
        try {
          unresolvedIncidents.latest;
        } catch (e) {
          expect(e, isInstanceOf<NoLatestException>());
        }
      }
    });

    test('success getting incident updates', () async {
      final unresolvedIncidents = await statusPage.incidents(fondeadoraPage);
      if (unresolvedIncidents.isNotEmpty) {
        final updatesList = unresolvedIncidents.latest.updates;
        expect(updatesList, isNot(null));
      }else{
        try {
          unresolvedIncidents.latest;
        } catch (e) {
          expect(e, isInstanceOf<NoLatestException>());
        }
      }
    });

    test('success getting incident update by component', () async {
      final unresolvedIncidents = await statusPage.incidents(fondeadoraPage);
      if (unresolvedIncidents.isNotEmpty) {
        final latestUpdateMessage = unresolvedIncidents.latest.updates!.latest.body;
        expect(latestUpdateMessage, isNot(null));
      }else{
        try {
          unresolvedIncidents.latest;
        } catch (e) {
          expect(e, isInstanceOf<NoLatestException>());
        }
      }
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
