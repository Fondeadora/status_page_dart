part of '../status_page.dart';

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

@JsonSerializable()
class Component {
  const Component({
    this.id,
    this.name,
    this.status,
    this.position,
    this.description,
    this.showcase,
  });

  final String? id;
  final String? name;
  final ComponentStatus? status;
  final int? position;
  final String? description;
  final bool? showcase;

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}

@JsonSerializable()
class SummaryComponent {
  const SummaryComponent({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.position,
    this.description,
    this.showcase,
    this.startDate,
    this.groupId,
    this.group,
    this.onlyShowIfDegraded,
  });

  final String? id;
  final String? name;
  final ComponentStatus? status;
  final String? createdAt;
  final String? updatedAt;
  final int? position;
  final String? description;
  final bool? showcase;
  final String? startDate;
  final String? groupId;
  final bool? group;
  final bool? onlyShowIfDegraded;

  factory SummaryComponent.fromJson(Map<String, dynamic> json) =>
      _$SummaryComponentFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryComponentToJson(this);
}
