part of '../status_page.dart';

@RestApi(baseUrl: "https://api.statuspage.io/v1")
abstract class StatusPageApi {
  factory StatusPageApi(Dio dio, [String? apiKey]) {
    dio.options = BaseOptions(
      headers: {'authorization': apiKey},
      receiveTimeout: 5000,
      connectTimeout: 5000,
    );
    return _StatusPageApi(dio);
  }

  @GET("/pages")
  Future<List<Page>> getPages();

  @GET("/pages/{pageId}")
  Future<Page> getPage(@Path() String pageId);

  @GET("/pages/{pageId}/components")
  Future<List<Component>> getComponents(@Path() String pageId);
}
