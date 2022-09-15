import './models.dart';

class DataServices {
  Stream<Report> streamReport() {
    final report = Report(topics: {});
    return Stream.value(report);
  }
}
