part of 'status_page_dart.dart';

class Page extends Equatable {
  const Page({
    required this.id,
    required this.name,
    this.components = const [],
  });

  final String id;
  final String name;
  final List<Component> components;

  Page copyWith({List<Component>? components}) {
    return Page(
      id: id,
      name: name,
      components: components ?? this.components,
    );
  }

  Component component(String current) {
    return components.where((Component c) => c.id == current).first;
  }

  @override
  List<Object> get props => [id, name, components];

  @override
  bool get stringify => true;
}

class Component extends Equatable {
  const Component({required this.id, required this.name, required this.status});

  final String id;
  final String name;
  final String status;

  @override
  List<Object> get props => [id, name, status];

  @override
  bool get stringify => true;
}
