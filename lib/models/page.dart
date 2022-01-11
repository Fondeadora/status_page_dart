part of '../status_page_dart.dart';

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
  final String? pageDescription;
  final String? subdomain;
  final String? domain;
  final String? url;
  final String? supportUrl;
  List<Component>? components;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);

  Component component(String componentId) =>
      components!.firstWhere((c) => c.id == componentId);
}
