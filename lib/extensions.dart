part of '../status_page.dart';

extension LatestIncident on List<Incident> {
  Incident get latest {
    if(isNotEmpty) {
      return first;
    }else{
      throw NoLatestException();
    }
  }
}
extension LatestIncidentUpdate on List<IncidentUpdate> {
  IncidentUpdate get latest {
    if(isNotEmpty) {
      return first;
    }else{
      throw NoLatestException();
    }
  }
}
