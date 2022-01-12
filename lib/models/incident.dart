part of '../status_page.dart';

@JsonSerializable()
class Incident {
  Incident({
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.monitoringAt,
    this.resolvedAt,
    this.impact,
    this.shortlink,
    this.startedAt,
    this.id,
    this.pageId,
    this.updates,
    this.components,
  });

  final String? name;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'monitoring_at')
  final DateTime? monitoringAt;
  @JsonKey(name: 'resolved_at')
  final DateTime? resolvedAt;
  final String? impact;
  final String? shortlink;
  @JsonKey(name: 'started_at')
  final DateTime? startedAt;
  final String? id;
  @JsonKey(name: 'page_id')
  final String? pageId;
  @JsonKey(name: 'incident_updates')
  final List<IncidentUpdate>? updates;
  final List<Component>? components;

  factory Incident.fromJson(Map<String, dynamic> json) =>
      _$IncidentFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentToJson(this);
}

@JsonSerializable()
class IncidentUpdate {
  IncidentUpdate({
    this.status,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.displayAt,
    this.id,
    this.incidentId,
    this.affectedComponents,
  });

  final String? status;
  final String? body;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'display_at')
  final DateTime? displayAt;
  final String? id;
  @JsonKey(name: 'incident_id')
  final String? incidentId;
  @JsonKey(name: 'affected_components')
  final List<AffectedComponent>? affectedComponents;

  factory IncidentUpdate.fromJson(Map<String, dynamic> json) =>
      _$IncidentUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentUpdateToJson(this);
}

@JsonSerializable()
class AffectedComponent {
  AffectedComponent({
    this.code,
    this.name,
    this.oldStatus,
    this.newStatus,
  });

  final String? code;
  final String? name;
  @JsonKey(name: 'old_status')
  final String? oldStatus;
  @JsonKey(name: 'new_status')
  final String? newStatus;

  factory AffectedComponent.fromJson(Map<String, dynamic> json) =>
      _$AffectedComponentFromJson(json);

  Map<String, dynamic> toJson() => _$AffectedComponentToJson(this);
}
