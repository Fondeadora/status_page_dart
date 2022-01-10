library status_page_dart;

class Status {
  String get status => 'status';
}

class Component {
  Status component(String component) {
    return Status();
  }
}

class StatusPage {
  Component page(String page) {
    return Component();
  }
}
