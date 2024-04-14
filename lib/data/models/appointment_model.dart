// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/appointment.dart';
import 'service_model.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
class AppointmentModel extends Appointment with _$AppointmentModel {
  @JsonSerializable(explicitToJson: true)
  const factory AppointmentModel({
    required List<ServiceModel> services,
    required DateTime appointmentDateTime,
    int? certificateId,
  }) = _AppointmentModel;

  factory AppointmentModel.fromJson(Map<String, Object?> json) =>
      _$AppointmentModelFromJson(json);
}
