// GENERATED CODE - DO NOT MODIFY BY HAND

part of status_page;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      id: json['id'] as String?,
      name: json['name'] as String?,
      pageDescription: json['page_description'] as String?,
      subdomain: json['subdomain'] as String?,
      domain: json['domain'] as String?,
      url: json['url'] as String?,
      supportUrl: json['support_url'] as String?,
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'page_description': instance.pageDescription,
      'subdomain': instance.subdomain,
      'domain': instance.domain,
      'url': instance.url,
      'support_url': instance.supportUrl,
      'components': instance.components,
    };

Incident _$IncidentFromJson(Map<String, dynamic> json) => Incident(
      name: json['name'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      monitoringAt: json['monitoring_at'] == null
          ? null
          : DateTime.parse(json['monitoring_at'] as String),
      resolvedAt: json['resolved_at'] == null
          ? null
          : DateTime.parse(json['resolved_at'] as String),
      impact: json['impact'] as String?,
      shortlink: json['shortlink'] as String?,
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      id: json['id'] as String?,
      pageId: json['page_id'] as String?,
      updates: (json['incident_updates'] as List<dynamic>?)
          ?.map((e) => IncidentUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IncidentToJson(Incident instance) => <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'monitoring_at': instance.monitoringAt?.toIso8601String(),
      'resolved_at': instance.resolvedAt?.toIso8601String(),
      'impact': instance.impact,
      'shortlink': instance.shortlink,
      'started_at': instance.startedAt?.toIso8601String(),
      'id': instance.id,
      'page_id': instance.pageId,
      'incident_updates': instance.updates,
      'components': instance.components,
    };

IncidentUpdate _$IncidentUpdateFromJson(Map<String, dynamic> json) =>
    IncidentUpdate(
      status: json['status'] as String?,
      body: json['body'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      displayAt: json['display_at'] == null
          ? null
          : DateTime.parse(json['display_at'] as String),
      id: json['id'] as String?,
      incidentId: json['incident_id'] as String?,
      affectedComponents: (json['affected_components'] as List<dynamic>?)
          ?.map((e) => AffectedComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IncidentUpdateToJson(IncidentUpdate instance) =>
    <String, dynamic>{
      'status': instance.status,
      'body': instance.body,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'display_at': instance.displayAt?.toIso8601String(),
      'id': instance.id,
      'incident_id': instance.incidentId,
      'affected_components': instance.affectedComponents,
    };

AffectedComponent _$AffectedComponentFromJson(Map<String, dynamic> json) =>
    AffectedComponent(
      code: json['code'] as String?,
      name: json['name'] as String?,
      oldStatus: json['old_status'] as String?,
      newStatus: json['new_status'] as String?,
    );

Map<String, dynamic> _$AffectedComponentToJson(AffectedComponent instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'old_status': instance.oldStatus,
      'new_status': instance.newStatus,
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

  @override
  Future<List<Incident>> getUnresolvedIncidents(pageId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Incident>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/pages/${pageId}/incidents/unresolved',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Incident.fromJson(i as Map<String, dynamic>))
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
