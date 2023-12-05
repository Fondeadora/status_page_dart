part of '../status_page.dart';

@RestApi(baseUrl: "https://api.statuspage.io/v1")
abstract class StatusPageApi {
  factory StatusPageApi(Dio dio, [String? apiKey]) {
    dio.options = BaseOptions(
      headers: {'authorization': apiKey},
      receiveTimeout: Duration(milliseconds: 5000),
      connectTimeout: Duration(milliseconds: 5000),
    );
    return _StatusPageApi(dio);
  }

  @GET("/pages")
  Future<List<Page>> getPages();

  @GET("/pages/{pageId}")
  Future<Page> getPage(@Path() String pageId);

  @GET("/pages/{pageId}/components")
  Future<List<Component>> getComponents(@Path() String pageId);

  @GET("/pages/{pageId}/incidents")
  Future<List<Incident>> getIncidents(@Path() String pageId);

  @GET("/pages/{pageId}/incidents/active_maintenance")
  Future<List<Incident>> getActiveMaintenanceIncidents(@Path() String pageId);

  @GET("/pages/{pageId}/incidents/scheduled")
  Future<List<Incident>> getScheduledIncidents(@Path() String pageId);

  @GET("/pages/{pageId}/incidents/unresolved")
  Future<List<Incident>> getUnresolvedIncidents(@Path() String pageId);

  @GET("/pages/{pageId}/incidents/upcoming")
  Future<List<Incident>> getUpcomingIncidents(@Path() String pageId);
}
