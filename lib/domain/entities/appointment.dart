import 'package:appointments/domain/entities/service.dart';

class Appointment {
  final List<Service> services;
  final DateTime appointmentDateTime;
  final int? certificateId;

  Appointment({
    required this.services,
    required this.appointmentDateTime,
    required this.certificateId,
  });
}
