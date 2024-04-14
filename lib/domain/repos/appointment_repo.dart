import '../entities/appointment.dart';

abstract class AppointmentRepo {
  Future<List<Appointment>?> getAppointments();
  Future<int?> addAppointment(Appointment appointment);
}
