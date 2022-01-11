// GENERATED CODE - DO NOT MODIFY BY HAND

part of status_page_dart;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      id: json['id'] as String?,
      name: json['name'] as String?,
      pageDescription: json['pageDescription'] as String?,
      subdomain: json['subdomain'] as String?,
      domain: json['domain'] as String?,
      url: json['url'] as String?,
      supportUrl: json['supportUrl'] as String?,
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pageDescription': instance.pageDescription,
      'subdomain': instance.subdomain,
      'domain': instance.domain,
      'url': instance.url,
      'supportUrl': instance.supportUrl,
      'components': instance.components,
    };

Incident _$IncidentFromJson(Map<String, dynamic> json) => Incident(
      name: json['name'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      monitoringAt: json['monitoringAt'] == null
          ? null
          : DateTime.parse(json['monitoringAt'] as String),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      impact: json['impact'] as String?,
      shortlink: json['shortlink'] as String?,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      id: json['id'] as String?,
      pageId: json['pageId'] as String?,
      incidentUpdates: (json['incidentUpdates'] as List<dynamic>?)
          ?.map((e) => IncidentUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => AffectedComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IncidentToJson(Incident instance) => <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'monitoringAt': instance.monitoringAt?.toIso8601String(),
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'impact': instance.impact,
      'shortlink': instance.shortlink,
      'startedAt': instance.startedAt?.toIso8601String(),
      'id': instance.id,
      'pageId': instance.pageId,
      'incidentUpdates': instance.incidentUpdates,
      'components': instance.components,
    };

IncidentUpdate _$IncidentUpdateFromJson(Map<String, dynamic> json) =>
    IncidentUpdate(
      status: json['status'] as String?,
      body: json['body'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      displayAt: json['displayAt'] == null
          ? null
          : DateTime.parse(json['displayAt'] as String),
      id: json['id'] as String?,
      incidentId: json['incidentId'] as String?,
      affectedComponents: (json['affectedComponents'] as List<dynamic>?)
          ?.map((e) => AffectedComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IncidentUpdateToJson(IncidentUpdate instance) =>
    <String, dynamic>{
      'status': instance.status,
      'body': instance.body,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'displayAt': instance.displayAt?.toIso8601String(),
      'id': instance.id,
      'incidentId': instance.incidentId,
      'affectedComponents': instance.affectedComponents,
    };

AffectedComponent _$AffectedComponentFromJson(Map<String, dynamic> json) =>
    AffectedComponent(
      code: json['code'] as String?,
      name: json['name'] as String?,
      oldStatus: json['oldStatus'] as String?,
      newStatus: json['newStatus'] as String?,
    );

Map<String, dynamic> _$AffectedComponentToJson(AffectedComponent instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'oldStatus': instance.oldStatus,
      'newStatus': instance.newStatus,
    };

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      id: json['id'] as String?,
      pageId: json['pageId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      position: json['position'] as int?,
      status: $enumDecodeNullable(_$ComponentStatusEnumMap, json['status']),
      showcase: json['showcase'] as bool?,
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'id': instance.id,
      'pageId': instance.pageId,
      'name': instance.name,
      'description': instance.description,
      'position': instance.position,
      'status': _$ComponentStatusEnumMap[instance.status],
      'showcase': instance.showcase,
    };

const _$ComponentStatusEnumMap = {
  ComponentStatus.operational: 'operational',
  ComponentStatus.underMaintenance: 'under_maintenance',
  ComponentStatus.degradedPerformance: 'degraded_performance',
  ComponentStatus.partialOutage: 'partial_outage',
  ComponentStatus.majorOutage: 'major_outage',
  ComponentStatus.undefined: '',
};

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _StatusPageApi implements StatusPageApi {
  _StatusPageApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.statuspage.io/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Page>> getPages() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Page>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/pages',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Page.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Page> getPage(pageId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Page>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/pages/${pageId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Page.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Component>> getComponents(pageId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Component>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/pages/${pageId}/components',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Component.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
