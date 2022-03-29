import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:status_page/status_page.dart';

void main() async {
  final Map<String, String> env = Platform.environment;

  late final String testPage;
  late final String testComponent;
  late final String apiKey;

  setUpAll(() {
    testPage = env['PAGE_ID'] ?? '';
    testComponent = env['COMPONENT_ID'] ?? '';
    apiKey = env['API_KEY'] ?? '';
  });

  group('StatusPage Library', () {
    late StatusPage statusPage;

    Future<void> handleRateLimiting(Future<void> Function() callback) async {
      try {
        await callback();
      } catch (e) {
        expect(e, isInstanceOf<EnhanceYourCalmException>());
      }
    }

    setUpAll(() {
      statusPage = StatusPage(apiKey: apiKey);
    });

    test('success when getting first page', () async {
      await handleRateLimiting(() async {
        final pages = await statusPage.pages;
        expect(pages.first, isNot(null));
      });
    });

    test('success when getting specific page', () async {
      await handleRateLimiting(() async {
        final page = await statusPage.page(testPage);
        expect(page.name, 'Fondeadora');
      });
    });

    test('success when getting component list', () async {
      await handleRateLimiting(() async {
        final page = await statusPage.page(testPage);
        expect(page.components, isNot(null));
      });
    });

    test('success when getting Apps móviles component', () async {
      await handleRateLimiting(() async {
        final page = await statusPage.page(testPage);
        final component = page.component(testComponent);
        expect(component.name, 'Apps móviles');
      });
    });

    test('success when getting Apps móviles component status', () async {
      await handleRateLimiting(() async {
        final page = await statusPage.page(testPage);
        final component = page.component(testComponent);
        expect(component.status, isNot(null));
      });
    });

    test('success getting unresolved incidents', () async {
      await handleRateLimiting(() async {
        final unresolvedIncidents = await statusPage.incidents(testPage);
        expect(unresolvedIncidents, isNot(null));
      });
    });

    test('success getting latest unresolved incident', () async {
      await handleRateLimiting(() async {
        final unresolvedIncidents = await statusPage.incidents(testPage);
        if (unresolvedIncidents.isNotEmpty) {
          final latestIncident = unresolvedIncidents.latest;
          expect(latestIncident, isNot(null));
        } else {
          try {
            unresolvedIncidents.latest;
          } catch (e) {
            expect(e, isInstanceOf<ResourceNotFoundException>());
          }
        }
      });
    });

    test('success getting incident updates', () async {
      await handleRateLimiting(() async {
        final unresolvedIncidents = await statusPage.incidents(testPage);
        if (unresolvedIncidents.isNotEmpty) {
          final updatesList = unresolvedIncidents.latest.updates;
          expect(updatesList, isNot(null));
        } else {
          try {
            unresolvedIncidents.latest;
          } catch (e) {
            expect(e, isInstanceOf<NoLatestException>());
          }
        }
      });
    });

    test('success getting incident update by component', () async {
      await handleRateLimiting(() async {
        final unresolvedIncidents = await statusPage.incidents(testPage);
        if (unresolvedIncidents.isNotEmpty) {
          final latestUpdateMessage =
              unresolvedIncidents.latest.updates!.latest.body;
          expect(latestUpdateMessage, isNot(null));
        } else {
          try {
            unresolvedIncidents.latest;
          } catch (e) {
            expect(e, isInstanceOf<NoLatestException>());
          }
        }
      });
    });
  });

  group('StatusPage summary', () {
    late final Summary summary;

    setUpAll(() async {
      summary = await StatusPage.summary(domain: 'status.fondeadora.app');
    });

    test('success when getting page name', () {
      expect(summary.page?.name, 'Fondeadora');
    });

    test('success when getting component list', () {
      expect(summary.components, isNot(null));
    });

    test('success when getting Apps móviles component', () {
      final component = summary.component(testComponent);
      expect(component.name, 'Apps móviles');
    });

    test('success when getting Apps móviles component status', () {
      final component = summary.component(testComponent);
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

    test('bad domain was provided', () async {
      try {
        final summary = await StatusPage.summary(domain: 'bad-domain');
        summary.page;
        fail("exception not thrown");
      } catch (e) {
        expect(e, isInstanceOf<ConnectionException>());
      }
    });
  });
}
