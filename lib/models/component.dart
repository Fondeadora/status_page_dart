part of '../status_page.dart';

@JsonSerializable()
class Component {
  Component({
    this.id,
    this.pageId,
    this.name,
    this.description,
    this.position,
    this.status,
    this.showcase,
  });

  final String? id;
  final String? pageId;
  final String? name;
  final String? description;
  final int? position;
  final ComponentStatus? status;
  final bool? showcase;

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}

enum ComponentStatus {
  @JsonValue('operational')
  operational,
  @JsonValue('under_maintenance')
  underMaintenance,
  @JsonValue('degraded_performance')
  degradedPerformance,
  @JsonValue('partial_outage')
  partialOutage,
  @JsonValue('major_outage')
  majorOutage,
  @JsonValue('')
  undefined,
}
