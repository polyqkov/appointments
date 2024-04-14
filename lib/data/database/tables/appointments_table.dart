import 'package:drift/drift.dart';

import '../../converters/services_model_converter.dart';

class AppointmentsTable extends Table {
  TextColumn get services =>
      text().map(const ServicesModelConverter()).named('services')();
  DateTimeColumn get appointmentDateTime =>
      dateTime().named('appointment_date_time')();
  IntColumn get certificateId => integer().named('certificate_id').nullable()();
}
