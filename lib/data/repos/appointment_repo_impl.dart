import '../../domain/entities/appointment.dart';
import '../../domain/repos/appointment_repo.dart';
import '../data_sources/appointments_data_source/appointments_local_data_source.dart';
import '../models/appointment_model.dart';
import '../models/service_model.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final AppointmentsLocalDataSource appointmentsLocalDataSource;

  AppointmentRepoImpl({required this.appointmentsLocalDataSource});

  @override
  Future<int?> addAppointment(Appointment appointment) =>
      appointmentsLocalDataSource.addAppointment(AppointmentModel(
        services: appointment.services
            .map(
              (service) => ServiceModel(
                id: service.id,
                name: service.name,
                price: service.price,
                currency: service.currency,
              ),
            )
            .toList(),
        appointmentDateTime: appointment.appointmentDateTime,
        certificateId: appointment.certificateId,
      ));

  @override
  Future<List<Appointment>?> getAppointments() =>
      appointmentsLocalDataSource.getAppointments();
}
