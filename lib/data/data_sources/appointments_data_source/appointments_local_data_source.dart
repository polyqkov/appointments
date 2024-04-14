import 'package:drift/drift.dart';

import '../../../common/injector/app_injector.dart';
import '../../database/app_database.dart';
import '../../models/appointment_model.dart';

abstract class AppointmentsLocalDataSource {
  Future<List<AppointmentModel>?> getAppointments();
  Future<int?> addAppointment(AppointmentModel appointment);
}

class AppointmentsLocalDataSourceImpl implements AppointmentsLocalDataSource {
  @override
  Future<int?> addAppointment(AppointmentModel appointment) {
    final entry = AppointmentsTableCompanion.insert(
      services: appointment.services,
      appointmentDateTime: appointment.appointmentDateTime,
      certificateId: Value(appointment.certificateId),
    );
    return AppInjector.injector
        .get<AppDatabase>()
        .into(AppInjector.injector.get<AppDatabase>().appointmentsTable)
        .insert(entry);
  }

  @override
  Future<List<AppointmentModel>?> getAppointments() async {
    List<AppointmentsTableData> rawAppointments =
        await AppInjector.injector.get<AppDatabase>().getAppointments();
    return rawAppointments
        .map((e) => AppointmentModel(
            services: e.services,
            appointmentDateTime: e.appointmentDateTime,
            certificateId: e.certificateId))
        .toList();
  }
}
