import '../../entities/appointment.dart';
import '../../repos/appointment_repo.dart';

class GetAppointments {
  final AppointmentRepo appointmentRepo;

  GetAppointments(this.appointmentRepo);

  Future<List<Appointment>?> get() => appointmentRepo.getAppointments();
}
