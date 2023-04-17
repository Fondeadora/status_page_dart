library status_page;

import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'enums/incident_type.dart';

part 'models/page.dart';

part 'models/incident.dart';

part 'models/component.dart';

part 'models/summary.dart';

part 'network/status_page_api.dart';

part 'status_page.g.dart';

part 'exceptions.dart';

part 'extensions.dart';

class StatusPage {
  StatusPage({required String apiKey}) : _apiKey = apiKey;

  final String _apiKey;
  static final _dio = Dio();
  late final _statusPageApi = StatusPageApi(_dio, _apiKey);

  Future<List<Page>> get pages {
    return _statusPageApi.getPages().catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          throw _handleError((obj as DioError));
        default:
          throw UnexpectedException();
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

  Future<List<Incident>> incidents(String pageId,
      [IncidentType? incidentType]) async {
    try {
      switch (incidentType) {
        case IncidentType.maintenance:
          return await _statusPageApi.getActiveMaintenanceIncidents(pageId);
        case IncidentType.scheduled:
          return await _statusPageApi.getScheduledIncidents(pageId);
        case IncidentType.unresolved:
          return await _statusPageApi.getUnresolvedIncidents(pageId);
        case IncidentType.upcoming:
          return await _statusPageApi.getUpcomingIncidents(pageId);
        default:
          return await _statusPageApi.getIncidents(pageId);
      }
    } on DioError catch (error) {
      throw _handleError(error);
    }
  }

  static Future<Summary> summary({required String domain}) async {
    try {
      final response = await _dio.get('https://$domain/api/v2/summary.json');
      return Summary.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (error) {
      throw _handleError(error);
    }
  }

  static Exception _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.cancel:
      case DioErrorType.other:
        return ConnectionException();
      case DioErrorType.response:
        return _handleCode(error.response?.statusCode ?? -1);
    }
  }

  static Exception _handleCode(int statusCode) {
    switch (statusCode) {
      case 401:
        return AuthException();
      case 420:
        return EnhanceYourCalmException();
      default:
        return ResourceNotFoundException();
    }
  }
}
