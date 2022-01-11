part of '../status_page_dart.dart';

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
    this.incidentUpdates,
    this.components,
  });

  final String? name;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? monitoringAt;
  final DateTime? resolvedAt;
  final String? impact;
  final String? shortlink;
  final DateTime? startedAt;
  final String? id;
  final String? pageId;
  final List<IncidentUpdate>? incidentUpdates;
  final List<AffectedComponent>? components;

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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? displayAt;
  final String? id;
  final String? incidentId;
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
  final String? oldStatus;
  final String? newStatus;

  factory AffectedComponent.fromJson(Map<String, dynamic> json) =>
      _$AffectedComponentFromJson(json);

  Map<String, dynamic> toJson() => _$AffectedComponentToJson(this);
}
