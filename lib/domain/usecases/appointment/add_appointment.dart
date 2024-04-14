import '../../entities/appointment.dart';
import '../../repos/appointment_repo.dart';

class AddAppointment {
  final AppointmentRepo appointmentRepo;

  AddAppointment(this.appointmentRepo);

  Future<int?> get(Appointment appointment) =>
      appointmentRepo.addAppointment(appointment);
}
