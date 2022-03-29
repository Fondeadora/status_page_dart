part of '../status_page.dart';

@JsonSerializable()
class SummaryPage {
  const SummaryPage({
    this.id,
    this.name,
    this.url,
    this.timeZone,
    this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? url;
  final String? timeZone;
  final String? updatedAt;

  factory SummaryPage.fromJson(Map<String, dynamic> json) =>
      _$SummaryPageFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryPageToJson(this);
}

@JsonSerializable()
class Page {
  Page({
    this.id,
    this.name,
    this.pageDescription,
    this.subdomain,
    this.domain,
    this.url,
    this.supportUrl,
    this.components,
  });

  final String? id;
  final String? name;
  @JsonKey(name: 'page_description')
  final String? pageDescription;
  final String? subdomain;
  final String? domain;
  final String? url;
  @JsonKey(name: 'support_url')
  final String? supportUrl;
  List<Component>? components;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);

  Component component(String componentId) =>
      components!.firstWhere((c) => c.id == componentId);
}
