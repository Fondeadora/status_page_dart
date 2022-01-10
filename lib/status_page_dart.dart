library status_page_dart;

import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'exceptions.dart';
part 'models.dart';

const String baseUrl = 'https://api.statuspage.io/v1';

class StatusPage {
  StatusPage({required String apiKey}) : _apiKey = apiKey;

  final String _apiKey;

  List<Page> pages = [];

  Future<void> get init async {
    final headers = {'Authorization': _apiKey};

    pages = await _retrievePages(headers);
  }

  void _verifyInitCall() {
    if (pages.isEmpty) {
      throw InitMethodNotCalled();
    }
  }

  Future<List<Page>> _retrievePages(Map<String, String> headers) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/pages'),
        headers: headers,
      );

      final data = json.decode(response.body);

      parseToPage(dynamic e) => Page(id: e['id'], name: e['name']);
      final parsedPages = List.from(data).map<Page>(parseToPage).toList();

      final pages = <Page>[];

      for (Page p in parsedPages) {
        final components = await _retrieveComponents(headers, p.id);
        pages.add(p.copyWith(components: components));
      }

      return pages;
    } catch (e) {
      throw RetrievingPagesError();
    }
  }

  Future<List<Component>> _retrieveComponents(
      Map<String, String> headers, String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/pages/$id/components'),
        headers: headers,
      );

      final data = json.decode(utf8.decode(response.bodyBytes));

      parseToComponent(dynamic e) =>
          Component(id: e['id'], name: e['name'], status: e['status']);

      return List.from(data).map<Component>(parseToComponent).toList();
    } catch (e) {
      throw RetrievingComponentsError();
    }
  }

  Page page(String current) {
    _verifyInitCall();

    return pages.where((Page p) => p.id == current).first;
  }
}
