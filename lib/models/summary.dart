part of '../status_page.dart';

@JsonSerializable()
class Summary {
  const Summary({
    this.page,
    this.components = const [],
  });

  final SummaryPage? page;
  final List<SummaryComponent> components;

  SummaryComponent component(String id) {
    return components.firstWhere((c) => c.id == id);
  }

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
