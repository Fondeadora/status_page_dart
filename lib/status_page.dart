library status_page;

import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'models/page.dart';

part 'models/incident.dart';

part 'models/component.dart';

part 'network/status_page_api.dart';

part 'status_page.g.dart';

part 'exceptions.dart';

part 'extensions.dart';

class StatusPage {
  StatusPage({required String apiKey}) : _apiKey = apiKey;

  final String _apiKey;
  final _dio = Dio();
  late final _statusPageApi = StatusPageApi(_dio, _apiKey);

  Future<List<Page>> get pages {
    return _statusPageApi.getPages().catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          throw _handleError((obj as DioError));
        default:
          break;
      }
    });
  }

  Future<Page> page(String pageId) async {
    try {
      Page page = await _statusPageApi.getPage(pageId);
      page.components = await _statusPageApi.getComponents(pageId);
      return page;
    } on DioError catch (error) {
      throw _handleError(error);
    }
  }

  Future<List<Incident>> incidents(String pageId) async {
    try {
      final incidents = await _statusPageApi.getUnresolvedIncidents(pageId);
      return incidents;
    } on DioError catch (error) {
      throw _handleError(error);
    }
  }

  Exception _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ConnectionException();
      case DioErrorType.response:
        if (error.response?.statusCode == 401) {
          return AuthException();
        } else {
          return ResourceNotFoundException();
        }
      case DioErrorType.cancel:
        return ConnectionException();
      case DioErrorType.other:
        return ConnectionException();
    }
  }
}
